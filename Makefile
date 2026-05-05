# Compiler settings
JASMINC  ?= jasminc
JASMINCT ?= jasmin-ct
CC = /usr/bin/gcc

# Implementation settings
ARCHITECTURE ?= x86-64
IMPLEMENTATION_TYPE ?= ref
IMPLEMENTATION = $(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)

# Parameter settings
PARAMETER_SET ?= sha2-128s
PARAM_FILE = params-spx-$(PARAMETER_SET).jinc
ACTIVE_PARAM_FILE = x86-64/ref/params/active_params.jinc
PARAM_HEADER = x86-64/ref/params/params.h
CLI = slh_dsa_cli

# Testing settings
OUTPUT_FILE_NAME = slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)

all: $(CLI)

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

# generate correct parameter files
.PHONY: params
params:
	echo 'require "$(PARAM_FILE)"' > $(ACTIVE_PARAM_FILE)

.PHONY: params_h
params_h:
	echo "#pragma once" > $(PARAM_HEADER)
	echo "#define SPX_N $(SPX_N)" >> $(PARAM_HEADER)
	echo "#define SPX_SIG_BYTES $(SPX_SIG_BYTES)" >> $(PARAM_HEADER)

# step 1: compile Jasmin -> assembly
$(OUTPUT_FILE_NAME).s: $(IMPLEMENTATION)/spx.jazz params params_h
	$(JASMINC) -o $(OUTPUT_FILE_NAME).s $(IMPLEMENTATION)/spx.jazz
	grep -q GNU-stack $(OUTPUT_FILE_NAME).s || echo '.section .note.GNU-stack,"",@progbits' >> $(OUTPUT_FILE_NAME).s

# step 2: compile everything into an executable
$(CLI): $(OUTPUT_FILE_NAME).s slh_dsa_cli.c x86-64/ref/misc/jasmin_syscall.o
	$(CC) $(OUTPUT_FILE_NAME).s slh_dsa_cli.c x86-64/ref/misc/jasmin_syscall.o -o $(CLI) -no-pie





# --------------------------------------------------------------------
#  KAT testing and safety checking
# --------------------------------------------------------------------
# For x86-64: Generate a shared-library to pass to ctypes.
$(OUTPUT_FILE_NAME).so: $(OUTPUT_FILE_NAME).s
	$(CC) $^ -fPIC -shared -o $@

TESTING_WRAPPER :=
ifeq ($(ARCHITECTURE), x86-64)
	TESTING_WRAPPER = $(OUTPUT_FILE_NAME).so
endif

.PHONY: pqc-kat-test
pqc-kat-test: $(TESTING_WRAPPER)
	python3 -m pytest \
		--parameter-set=$(PARAMETER_SET) \
		--architecture=$(ARCHITECTURE) \
		--implementation-type=$(IMPLEMENTATION_TYPE) \
		tests/test_pqc_kats.py






# clean build artifacts
.PHONY: clean
clean:
	rm -rf *.s *.o *.so outputs $(CLI) $(ACTIVE_PARAM_FILE) $(PARAM_HEADER)