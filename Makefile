# Compiler settings
JASMINC = jasminc
CC = cc

# Files
JASMIN_SRC = spx.jazz
ASM = spx.s
TARGET = test

# Default target
all: $(TARGET)

# Step 1: compile Jasmin -> assembly
$(ASM): $(JASMIN_SRC)
	$(JASMINC) -o $(ASM) $(JASMIN_SRC)
	grep -q GNU-stack $(ASM) || echo '.section .note.GNU-stack,"",@progbits' >> $(ASM)

# Step 2: compile everything into executable
$(TARGET): $(ASM) test.c jasmin_syscall.o
	$(CC) $(ASM) test.c jasmin_syscall.o -o $(TARGET) -no-pie

# Run the program
run: $(TARGET)
	./$(TARGET)

# Clean build files
clean:
	rm -f $(ASM) $(TARGET)