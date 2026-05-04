# Compiler settings
JASMINC = jasminc
CC = /usr/bin/gcc

# Files
SPX = x86-64/ref/spx.jazz
ASM = spx.s
CLI = spx_cli

# Default parameter set (can be overridden)
PARAMSET ?= sha2-128s
PARAM_FILE = params-spx-$(PARAMSET).jinc
ACTIVE_PARAM_FILE = x86-64/ref/params/active_params.jinc
PARAM_HEADER = x86-64/ref/params/params.h

all: $(CLI)

# TODO replace by extracting constants from .jinc param file
ifneq (,$(filter %128f,$(PARAMSET)))
  SPX_N = 16
  SPX_SIG_BYTES = 17088
endif

ifneq (,$(filter %128s,$(PARAMSET)))
  SPX_N = 16
  SPX_SIG_BYTES = 7856
endif

ifneq (,$(filter %192f,$(PARAMSET)))
  SPX_N = 24
  SPX_SIG_BYTES = 35664
endif

ifneq (,$(filter %192s,$(PARAMSET)))
  SPX_N = 24
  SPX_SIG_BYTES = 16224
endif

ifneq (,$(filter %256f,$(PARAMSET)))
  SPX_N = 32
  SPX_SIG_BYTES = 49856
endif

ifneq (,$(filter %256s,$(PARAMSET)))
  SPX_N = 32
  SPX_SIG_BYTES = 29792
endif

# Step 0: generate correct parameter files
.PHONY: params
params:
	echo 'require "$(PARAM_FILE)"' > $(ACTIVE_PARAM_FILE)

.PHONY: params_h
params_h:
	echo "#pragma once" > $(PARAM_HEADER)
	echo "#define SPX_N $(SPX_N)" >> $(PARAM_HEADER)
	echo "#define SPX_SIG_BYTES $(SPX_SIG_BYTES)" >> $(PARAM_HEADER)

# step 1: compile Jasmin -> assembly
$(ASM): $(SPX) params params_h
	$(JASMINC) -o $(ASM) $(SPX)
	grep -q GNU-stack $(ASM) || echo '.section .note.GNU-stack,"",@progbits' >> $(ASM)

# step 2: compile everything into an executable
$(CLI): $(ASM) spx_cli.c x86-64/ref/misc/jasmin_syscall.o
	$(CC) $(ASM) spx_cli.c x86-64/ref/misc/jasmin_syscall.o -o $(CLI) -no-pie

# clean build artifacts
.PHONY: clean
clean:
	rm -rf $(ACTIVE_PARAM_FILE) $(PARAM_HEADER) $(CLI) *.s *.o *.so outputs