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
PARAMETER_SET ?= sha2-128s
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
all: $(CLI)

# clean build artifacts
.PHONY: clean
clean:
	rm -rf *.s *.o *.so outputs $(CLI) $(ACTIVE_PARAM_FILE) $(PARAM_HEADER) *.json

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

# link the correct parameter Jasmin file
.PHONY: params
params:
	echo 'require "$(PARAM_FILE)"' > $(ACTIVE_PARAM_FILE)

# link the correct parameter header
.PHONY: params_h
params_h:
	echo "#pragma once" > $(PARAM_HEADER)
	echo "#define SPX_N $(SPX_N)" >> $(PARAM_HEADER)
	echo "#define SPX_SIG_BYTES $(SPX_SIG_BYTES)" >> $(PARAM_HEADER)

# ---------------------------------------------------------------- #
#  COMPILING                                                       #
# ---------------------------------------------------------------- #

# compile SPHINCS+ CLI from Jasmin to assembly
$(OUTPUT_FILE_NAME).s: $(IMPLEMENTATION)/spx.jazz params params_h
	$(JASMINC) -o $(OUTPUT_FILE_NAME).s $(IMPLEMENTATION)/spx.jazz
	grep -q GNU-stack $(OUTPUT_FILE_NAME).s || echo '.section .note.GNU-stack,"",@progbits' >> $(OUTPUT_FILE_NAME).s

# compile Jasmin into a CLI executable
$(CLI): $(OUTPUT_FILE_NAME).s slh_dsa_cli.c x86-64/ref/misc/jasmin_syscall.o
	$(CC) $(OUTPUT_FILE_NAME).s slh_dsa_cli.c x86-64/ref/misc/jasmin_syscall.o -o $(CLI) -no-pie

# ---------------------------------------------------------------- #
#  KAT TESTING                                                     #
# ---------------------------------------------------------------- #

# compile SPHINCS+ API from Jasmin to assembly
$(OUTPUT_FILE_NAME)_kattest.s: $(IMPLEMENTATION)/spx/spx.jinc params params_h
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

# convert the .rsp KATs to .json, and run the implemnetation against the KATs
.PHONY: pqc-kat-test
pqc-kat-test: $(TESTING_WRAPPER)
	python3 tests/pqc/convert_rsp_to_json.py
	python3 -m pytest \
		--parameter-set=$(PARAMETER_SET) \
		--architecture=$(ARCHITECTURE) \
		--implementation-type=$(IMPLEMENTATION_TYPE) \
		tests/test_pqc_kats.py