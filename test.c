#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#include "params/params.h" // contains SPX_N and SPX_SIG_BYTES, which Makefile defines based on PARAMSET

extern int slh_keygen(uint8_t *sk, uint8_t *pk);
extern int slh_sign(uint8_t *sig, uint64_t m_addr, uint64_t m_len, uint8_t *sk);
extern int slh_verify(uint64_t m_addr, uint64_t m_len, uint8_t *sig, uint8_t *pk);

void keygen(uint8_t *sk, uint8_t *pk) {
    int r = slh_keygen(sk, pk);
    assert(r == 0);

    printf("SPHINCS+ secret key:");
    for (int i=0; i < 4*SPX_N; i++) {
        if (i == 0 * 4*SPX_N/4) {
            printf("\n[SK.seed] ");
        } else if (i == 1 * 4*SPX_N/4) {
            printf("\n[SK.prf]  ");
        } else if (i == 2 * 4*SPX_N/4) {
            printf("\n[PK.seed] ");
        } else if (i == 3 * 4*SPX_N/4) {
            printf("\n[PK.root] ");
        }

        printf("%02X", sk[i]);
        if (i%2 == 1) {
            printf(" ");
        }
    }
    printf("\n\n");

    printf("SPHINCS+ public key:");
    for (int i=0; i < 2*SPX_N; i++) {
        if (i == 0 * 2*SPX_N/2) {
            printf("\n[PK.seed] ");
        } else if (i == 1 * 2*SPX_N/2) {
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
    // for (int i=0; i < SPX_SIG_BYTES; i++) {
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
    uint8_t sk[4*SPX_N] = {0};
    uint8_t pk[2*SPX_N] = {0};
    keygen(sk, pk);
    
    uint8_t sig[SPX_SIG_BYTES] = {0};

    uint8_t msg[] = "SPHINCS+";
    size_t msg_len = sizeof(msg) - 1; // exclude null terminator

    sign((uint8_t*)msg, msg_len, sig, sk);

    verify((uint8_t*)msg, msg_len, sig, pk);

    return 0;
}