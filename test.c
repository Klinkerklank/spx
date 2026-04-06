#include <stdio.h>
#include <stdint.h>
#include <assert.h>

// command to run this file:
// clear; cd ~/spx; jasminc -o spx.s spx.jazz; echo '.section .note.GNU-stack,"",@progbits' >> spx.s; gcc spx.s test.c -o test -no-pie; ./test

uint8_t test_ADRS(uint64_t adrs_addr, uint64_t adrsc_addr);
uint8_t test_H_msg(uint64_t digest, uint64_t m_addr, uint64_t m_len);
uint8_t test_PRF_msg(uint64_t digest, uint64_t m_addr, uint64_t m_len);
uint8_t test_F(uint64_t digest);
uint8_t test_H(uint64_t digest);
uint8_t test_T_len(uint64_t digest);
uint8_t test_T_k(uint64_t digest);

int ADRS() {
    uint32_t adrs[8] = {0};
    uint8_t adrsc[22] = {0};

    uint8_t r = test_ADRS((uint64_t)adrs, (uint64_t)adrsc);
    assert(r == 0);

    printf("ADRS:\n");
    for (int i = 0; i < sizeof(adrs); i++) {
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
    for (int i = 0; i < sizeof(adrsc); i++) {
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

int H_msg() {
    uint8_t digest[34] = {0};

    uint8_t input[] = {
        0x61, 0x62, 0x63
    };
    
    uint8_t r = test_H_msg((uint64_t)digest,(uint64_t)input,(uint64_t)sizeof(input));
    assert(r == 0);


    printf("H_msg(");
    for (int i = 0; i < sizeof(input); i++) {
        printf("%02X", input[i]);
        if (i < sizeof(input)-1) {
            printf(",");
        }
    }
    printf("):\n");
    for (int i = 0; i < sizeof(digest); i++) {
        printf("%02X", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n\n");

    return 0;
}

int PRF_msg() {
    uint8_t digest[16] = {0};

    uint8_t input[] = {
        0x61, 0x62, 0x63
    };
    
    uint8_t r = test_PRF_msg((uint64_t)digest,(uint64_t)input,(uint64_t)sizeof(input));
    assert(r == 0);

    printf("PRF_msg(");
    for (int i = 0; i < sizeof(input); i++) {
        printf("%02X", input[i]);
        if (i < sizeof(input)-1) {
            printf(",");
        }
    }
    printf("):\n");
    for (int i = 0; i < sizeof(digest); i++) {
        printf("%02X", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n\n");

    return 0;
}

int F() {
    uint8_t digest[16] = {0};
    uint8_t r = test_F((uint64_t)digest);
    assert(r == 0);

    printf("F:\n");
    for (int i = 0; i < sizeof(digest); i++) {
        printf("%02X", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n\n");

    return 0;
}

int H() {
    uint8_t digest[16] = {0};
    uint8_t r = test_H((uint64_t)digest);
    assert(r == 0);

    printf("H:\n");
    for (int i = 0; i < sizeof(digest); i++) {
        printf("%02X", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n\n");

    return 0;
}

int T_len() {
    uint8_t digest[16] = {0};
    uint8_t r = test_T_len((uint64_t)digest);
    assert(r == 0);

    printf("T_len:\n");
    for (int i = 0; i < sizeof(digest); i++) {
        printf("%02X", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n\n");

    return 0;
}

int T_k() {
    uint8_t digest[16] = {0};
    uint8_t r = test_T_k((uint64_t)digest);
    assert(r == 0);

    printf("T_k:\n");
    for (int i = 0; i < sizeof(digest); i++) {
        printf("%02X", digest[i]);
        if (i%2 == 1) {
        printf(" ");
        }
    }
    printf("\n\n");

    return 0;
}

int main() {
    // ADRS();
    H_msg();
    PRF_msg();
    F();
    H();
    T_len();
    T_k();

    return 0;
}