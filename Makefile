# Compiler settings
JASMINC = jasminc
CC = /usr/bin/gcc

# Files
JASMIN_SRC = spx.jazz
ASM = spx.s
TARGET = test

# Default parameter set (can be overridden)
PARAM ?= sha2-128s
PARAM_FILE = params-spx-$(PARAM).jinc
ACTIVE_PARAM_FILE = params/active_params.jinc

.PHONY: params

all: $(TARGET)

# Step 0: generate active parameter include
params:
	echo 'require "$(PARAM_FILE)"' > $(ACTIVE_PARAM_FILE)

# Step 1: compile Jasmin -> assembly
$(ASM): $(JASMIN_SRC) params
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
	rm -f $(ASM) $(TARGET) $(ACTIVE_PARAM_FILE)