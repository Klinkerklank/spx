#include <stdio.h>
#include <stdint.h>
#include <assert.h>

// command to run this file:
// clear; cd ~/spx; jasminc -o spx.s spx.jazz; echo '.section .note.GNU-stack,"",@progbits' >> spx.s; gcc spx.s test.c -o test -no-pie; ./test

uint8_t test_adrs(uint64_t adrs_addr, uint64_t adrsc_addr); // declaration of the ADRS testing function
uint8_t test_sha256(uint64_t digest); // declaration of the SHA256 testing function

int sha256() {
    uint8_t digest[16] = {0};
    uint8_t r = test_sha256((uint64_t)digest);
    assert(r == 0);

    printf("SHA256:\n");
    for (int i = 0; i < 16; i++) {
        printf("%02x", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n");

    return 0;
}

int adrs() {
    uint32_t adrs[8] = {0};
    uint8_t adrsc[22] = {0};

    uint8_t r = test_adrs((uint64_t)adrs, (uint64_t)adrsc);
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

    printf("\n");
    printf("ADRS^c:\n");
    for (int i = 0; i < 22; i++) {
        if (i == 0) {
            printf("      %01X", adrsc[i]);
            printf(" (layer addr)\n");
        } else if (i == 1 || i == 5) {
            printf("%01X%01X%01X%01X", adrsc[i],adrsc[i+1],adrsc[i+2],adrsc[i+3]);
            printf(" (tree addr)\n");
        } else if (i == 9) {
            printf("      %01X", adrsc[i]);
            printf(" (type)\n");
        } else if (i == 10 || i == 14 || i == 18) {
            printf("%01X%01X%01X%01X", adrsc[i],adrsc[i+1],adrsc[i+2],adrsc[i+3]);
            printf(" (remainder)\n");
        }
    }
    printf("\n");

    return 0;
}

int main() {
    adrs();
    // sha256();

    return 0;
}