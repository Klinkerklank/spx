#include <stdio.h>
#include <stdint.h>
#include <assert.h>

// command to run this file:
// clear; cd ~/spx; jasminc -o spx.s spx.jazz; echo '.section .note.GNU-stack,"",@progbits' >> spx.s; gcc spx.s main.c -o test -no-pie; ./test

uint8_t spx(uint64_t adrs_addr); // declaration of the SPHINCS+ Jasmin function

int main() {
    uint32_t adrs[8] = {0};

    uint8_t r = spx((uint64_t)adrs);
    assert(r == 0);

    printf("ADRS:\n");
    for (int i = 0; i < 8; i++) {
        printf("%08X", adrs[i]);
        if (i == 0) {
            printf(" (layer addr)\n");
        } else if (i == 1 || i == 2 || i == 3) {
            printf(" (tree addr)\n");
        } else if (i == 4) {
            printf(" (type)\n");
        } else if (i == 5) {
            printf(" (key pair addr)\n");
        } else if (i == 6) {
            printf(" (chain addr / tree height)\n");
        } else if (i == 7) {
            printf(" (hash addr / tree idx)\n");
        }
    }

    return 0;
}