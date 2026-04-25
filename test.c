// command to run this file:
// clear; cd ~/spx; jasminc -o spx.s spx.jazz; echo '.section .note.GNU-stack,"",@progbits' >> spx.s; cc spx.s test.c jasmin_syscall.o -o test -no-pie; ./test

// command to run this file with Jasmin register liveness check written to log.txt:
// clear; cd ~/spx; jasminc -pliveness -o spx.s spx.jazz > log.txt; echo '.section .note.GNU-stack,"",@progbits' >> spx.s; cc spx.s test.c jasmin_syscall.o -o test -no-pie; ./test

#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#define N (16)
#define SK_LEN (4*N)
#define PK_LEN (2*N)
#define SIG_LEN (7856)

extern int slh_keygen(uint8_t *sk, uint8_t *pk);
extern int slh_sign(uint8_t *sig, uint64_t m_addr, uint64_t m_len, uint8_t *sk);
extern int slh_verify(uint64_t m_addr, uint64_t m_len, uint8_t *sig, uint8_t *pk);

void keygen(uint8_t *sk, uint8_t *pk) {
    int r = slh_keygen(sk, pk);
    assert(r == 0);

    printf("SPHINCS+ secret key:");
    for (int i=0; i < SK_LEN; i++) {
        if (i == 0 * SK_LEN/4) {
            printf("\n[SK.seed] ");
        } else if (i == 1 * SK_LEN/4) {
            printf("\n[SK.prf]  ");
        } else if (i == 2 * SK_LEN/4) {
            printf("\n[PK.seed] ");
        } else if (i == 3 * SK_LEN/4) {
            printf("\n[PK.root] ");
        }

        printf("%02X", sk[i]);
        if (i%2 == 1) {
            printf(" ");
        }
    }
    printf("\n\n");

    printf("SPHINCS+ public key:");
    for (int i=0; i < PK_LEN; i++) {
        if (i == 0 * PK_LEN/2) {
            printf("\n[PK.seed] ");
        } else if (i == 1 * PK_LEN/2) {
            printf("\n[PK.root] ");
        }

        printf("%02X", pk[i]);
        if (i%2 == 1) {
            printf(" ");
        }
    }
    printf("\n\n");
}

void sign(uint8_t *msg, size_t msg_len, uint8_t *sig, uint8_t *sk) {
    printf("Message to sign:\n%s\n\n", msg);
    
    int r = slh_sign(sig, (uint64_t)msg, (uint64_t)msg_len, sk);
    assert(r == 0);

    // printf("SPHINCS+ signature:\n");
    // for (int i=0; i < SIG_LEN; i++) {
    //     printf("%02X", sig[i]);
    //     if (i%2 == 1) {
    //         printf(" ");
    //     }
    // }
    // printf("\n\n");
}

void verify(uint8_t *msg, size_t msg_len, uint8_t *sig, uint8_t *pk) {
    int r = slh_verify((uint64_t)msg, (uint64_t)msg_len, sig, pk);
    
    printf("Verification: ");
    if (r == 0) {
        printf("PASSED\n\n");
    } else {
        printf("FAILED\n\n");
    }
}

int main() {
    uint8_t sk[SK_LEN] = {0};
    uint8_t pk[PK_LEN] = {0};
    keygen(sk, pk);

    // uint8_t sk[SK_LEN] = {
    //     0x60, 0x60, 0xDD, 0xFA, 0x90, 0x99, 0xC2, 0xE4, 
    //     0x3C, 0x79, 0xB5, 0xF1, 0xF2, 0xA9, 0xCA, 0x5D, 
    //     0x50, 0x8E, 0xB2, 0x21, 0x58, 0x95, 0x3E, 0xD8, 
    //     0x3F, 0x5F, 0x85, 0x28, 0xE4, 0x53, 0xD3, 0x11, 
    //     0x1B, 0xE7, 0xBA, 0x6E, 0x28, 0x46, 0x09, 0x27, 
    //     0x3F, 0x7E, 0xFE, 0x3A, 0x4D, 0x32, 0x1E, 0x56, 
    //     0x63, 0x7E, 0x2D, 0x50, 0x06, 0xC4, 0x0F, 0x3F, 
    //     0xDB, 0x68, 0x24, 0xF8, 0xA6, 0x0C, 0x61, 0xB9
    // };
    
    // uint8_t pk[PK_LEN] = {
    //     0x1B, 0xE7, 0xBA, 0x6E, 0x28, 0x46, 0x09, 0x27, 
    //     0x3F, 0x7E, 0xFE, 0x3A, 0x4D, 0x32, 0x1E, 0x56, 
    //     0x63, 0x7E, 0x2D, 0x50, 0x06, 0xC4, 0x0F, 0x3F, 
    //     0xDB, 0x68, 0x24, 0xF8, 0xA6, 0x0C, 0x61, 0xB9
    // };
    
    uint8_t sig[SIG_LEN] = {0};

    uint8_t msg[] = "SPHINCS+";
    size_t msg_len = sizeof(msg) - 1; // exclude null terminator

    sign((uint8_t*)msg, msg_len, sig, sk);

    verify((uint8_t*)msg, msg_len, sig, pk);

    return 0;
}