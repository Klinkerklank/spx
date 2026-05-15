# ---------------------------------------------------------------- #
#  SETTINGS                                                        #
# ---------------------------------------------------------------- #

# compiler settings
JASMINC  ?= jasminc
JASMINCT ?= jasmin-ct
CC = /usr/bin/gcc

# implementation settings
ARCHITECTURE ?= x86-64
IMPLEMENTATION_TYPE ?= ref
IMPLEMENTATION = $(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)

# parameter settings
PARAMETER_SET ?= sha2-128f
PARAM_FILE = params-spx-$(PARAMETER_SET).jinc
ACTIVE_PARAM_FILE = x86-64/ref/params/active_params.jinc
PARAM_HEADER = x86-64/ref/params/params.h
CLI = slh_dsa_cli

# file name
OUTPUT_FILE_NAME = slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)

# ---------------------------------------------------------------- #
#  STANDARD MAKEFILE STUFF                                         #
# ---------------------------------------------------------------- #

# default behaviour
all: acvp-kat-test

# clean build artifacts
.PHONY: clean
clean:
	rm -rf \
		*.s *.o *.so \
		outputs \
		$(CLI) \
		$(ACTIVE_PARAM_FILE) $(PARAM_HEADER) \
		.pytest_cache tests/__pycache__ tests/pyAES_DRBG/__pycache__/ \
		tests/cref/json/*.json tests/acvp/grouped/*.json

# ---------------------------------------------------------------- #
#  PARAMETER HANDLING                                              #
# ---------------------------------------------------------------- #

# set the correct values of SPX_N and SPX_SIG_BYTES
ifneq (,$(filter %128f,$(PARAMETER_SET)))
  SPX_N = 16
  SPX_SIG_BYTES = 17088
endif
ifneq (,$(filter %128s,$(PARAMETER_SET)))
  SPX_N = 16
  SPX_SIG_BYTES = 7856
endif
ifneq (,$(filter %192f,$(PARAMETER_SET)))
  SPX_N = 24
  SPX_SIG_BYTES = 35664
endif
ifneq (,$(filter %192s,$(PARAMETER_SET)))
  SPX_N = 24
  SPX_SIG_BYTES = 16224
endif
ifneq (,$(filter %256f,$(PARAMETER_SET)))
  SPX_N = 32
  SPX_SIG_BYTES = 49856
endif
ifneq (,$(filter %256s,$(PARAMETER_SET)))
  SPX_N = 32
  SPX_SIG_BYTES = 29792
endif

# select the correct hash function implementation file
ifneq (,$(filter sha2-128s sha2-128f,$(PARAMETER_SET)))
  HASH_IMPL = ../hash/hash_sha256.jinc
endif
ifneq (,$(filter sha2-192s sha2-192f sha2-256s sha2-256f,$(PARAMETER_SET)))
  HASH_IMPL = ../hash/hash_sha512.jinc
endif

# Make the Jasmin parameter header, with the SPHINCS+ parameters and the hash function implementations
$(ACTIVE_PARAM_FILE):
	echo 'require "$(PARAM_FILE)" // SPHINCS+ parameters' >> $(ACTIVE_PARAM_FILE)
	echo 'require "$(HASH_IMPL)" // hash function implementations' >> $(ACTIVE_PARAM_FILE)

# Make the C parameter header
$(PARAM_HEADER):
	echo "#define SPX_N $(SPX_N)" >> $(PARAM_HEADER)
	echo "#define SPX_SIG_BYTES $(SPX_SIG_BYTES)" >> $(PARAM_HEADER)

# ---------------------------------------------------------------- #
#  COMPILING                                                       #
# ---------------------------------------------------------------- #

# compile SPHINCS+ CLI from Jasmin to assembly
$(OUTPUT_FILE_NAME).s: $(IMPLEMENTATION)/spx.jazz $(ACTIVE_PARAM_FILE) $(PARAM_HEADER)
	$(JASMINC) -o $(OUTPUT_FILE_NAME).s $(IMPLEMENTATION)/spx.jazz
	grep -q GNU-stack $(OUTPUT_FILE_NAME).s || echo '.section .note.GNU-stack,"",@progbits' >> $(OUTPUT_FILE_NAME).s

# compile Jasmin into a CLI executable
$(CLI): $(OUTPUT_FILE_NAME).s slh_dsa_cli.c x86-64/ref/misc/jasmin_syscall.o
	$(CC) $(OUTPUT_FILE_NAME).s slh_dsa_cli.c x86-64/ref/misc/jasmin_syscall.o -o $(CLI) -no-pie

# ---------------------------------------------------------------- #
#  KAT TESTING                                                     #
# ---------------------------------------------------------------- #

# compile SPHINCS+ API from Jasmin to assembly
$(OUTPUT_FILE_NAME)_kattest.s: $(IMPLEMENTATION)/spx/spx.jinc $(ACTIVE_PARAM_FILE) $(PARAM_HEADER)
	$(JASMINC) -o $(OUTPUT_FILE_NAME)_kattest.s $(IMPLEMENTATION)/spx/spx.jinc
	grep -q GNU-stack $(OUTPUT_FILE_NAME)_kattest.s || echo '.section .note.GNU-stack,"",@progbits' >> $(OUTPUT_FILE_NAME)_kattest.s

# generate a shared library
$(OUTPUT_FILE_NAME).so: $(OUTPUT_FILE_NAME)_kattest.s
	$(CC) $^ -fPIC -shared -o $@

# generate the testing wrapper using the shared library
TESTING_WRAPPER :=
ifeq ($(ARCHITECTURE), x86-64)
	TESTING_WRAPPER = $(OUTPUT_FILE_NAME).so
endif

# convert the .rsp KATs to .json, and run the implementation against the KATs
.PHONY: cref-kat-test
cref-kat-test: $(TESTING_WRAPPER)
	python3 tests/cref/convert_rsp_to_json.py
	python3 -m pytest \
		--parameter-set=$(PARAMETER_SET) \
		--architecture=$(ARCHITECTURE) \
		--implementation-type=$(IMPLEMENTATION_TYPE) \
		tests/test_cref_kats.py

# group the test vectors in .json files per parameter set, and run the implementation against the KATs
.PHONY: acvp-kat-test
acvp-kat-test: $(TESTING_WRAPPER)
	python3 tests/acvp/group_json_per_paramset.py
	python3 -m pytest \
		--parameter-set=$(PARAMETER_SET) \
		--architecture=$(ARCHITECTURE) \
		--implementation-type=$(IMPLEMENTATION_TYPE) \
		tests/test_acvp_kats.py