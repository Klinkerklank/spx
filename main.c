#include <stdio.h>
#include <stdint.h>

uint64_t spx(void); // declaration of Jasmin function

int main() {
    uint64_t r = spx();
    printf("0x%016lx\n", r); // print an output of 64 bytes in hexadecimal
    return 0;
}