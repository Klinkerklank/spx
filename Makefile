.PHONY: params run

# Compiler settings
JASMINC = jasminc
CC = /usr/bin/gcc

# Files
JASMIN_SRC = spx.jazz
ASM = spx.s
TARGET = test

# Default parameter set (can be overridden)
PARAMSET ?= sha2-128s
PARAM_FILE = params-spx-$(PARAMSET).jinc
ACTIVE_PARAM_FILE = params/active_params.jinc
PARAM_HEADER = params/params.h

all: $(TARGET)

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
params:
	echo 'require "$(PARAM_FILE)"' > $(ACTIVE_PARAM_FILE)

params_h:
	echo "#pragma once" > $(PARAM_HEADER)
	echo "#define SPX_N $(SPX_N)" >> $(PARAM_HEADER)
	echo "#define SPX_SIG_BYTES $(SPX_SIG_BYTES)" >> $(PARAM_HEADER)

# Step 1: compile Jasmin -> assembly
$(ASM): $(JASMIN_SRC) params params_h
	$(JASMINC) -o $(ASM) $(JASMIN_SRC)
	grep -q GNU-stack $(ASM) || echo '.section .note.GNU-stack,"",@progbits' >> $(ASM)

# Step 2: compile everything into executable
$(TARGET): $(ASM) test.c misc/jasmin_syscall.o
	$(CC) $(ASM) test.c misc/jasmin_syscall.o -o $(TARGET) -no-pie

# Run the program
run: $(TARGET)
	./$(TARGET)

# Clean build files
clean:
	rm -f $(ASM) $(TARGET) $(ACTIVE_PARAM_FILE) $(PARAM_HEADER)