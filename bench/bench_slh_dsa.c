// #include <openssl/sha.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>

#include "../x86-64/ref/params/params.h" // contains SPX_N and SPX_SIG_BYTES
#include "../slh_dsa_cli.h"              // declare the Jasmin export function signatures in spx.jazz

#include "bench.h"

#include "randombytes.c"

#define TIMINGS 10
#define SPX_MSG_LEN 32
#define SPX_CTX_LEN 32

void bench_slh_dsa_keygen(void) {
    uint8_t sk[4 * SPX_N]; // secret key
    uint8_t pk[2 * SPX_N]; // public key

    BENCHMARK_N_TIMES(TIMINGS, "bench/results/slh_dsa_keygen.txt", slh_keygen(sk, pk));
}

void bench_slh_dsa_sign(void) {
    uint8_t sk[4 * SPX_N]; // secret key
    uint8_t pk[2 * SPX_N]; // public key

    // generate secret/public key pair (not measured)
    int r = slh_keygen(sk, pk);
    assert(r == 0);

    size_t ctx_len = SPX_CTX_LEN; // context length
    size_t msg_len = SPX_MSG_LEN; // message length
    uint8_t ctx_ptr[ctx_len]; // context pointer
    uint8_t msg_ptr[msg_len]; // message pointer

    // generate random message and context (not measured)
    randombytes(ctx_ptr, SPX_CTX_LEN);
    randombytes(msg_ptr, SPX_MSG_LEN);

    uint64_t ctx_msg_ptrs[2]; // combined context and message pointers
    uint64_t ctx_msg_lens[2]; // combined context and message lengths

    ctx_msg_ptrs[0] = (uint64_t) ctx_ptr;
    ctx_msg_ptrs[1] = (uint64_t) msg_ptr;
    ctx_msg_lens[0] = (uint64_t) ctx_len;
    ctx_msg_lens[1] = (uint64_t) msg_len;

    bool deterministic = false; // choice of (non)deterministic message randomiser generation
    
    uint8_t sig[SPX_SIG_BYTES]; // signature buffer

    BENCHMARK_N_TIMES(TIMINGS, "bench/results/slh_dsa_sign.txt", slh_sign(sig, ctx_msg_ptrs, ctx_msg_lens, sk, (uint8_t) deterministic));
}

void bench_slh_dsa_verify(void) {
    uint8_t sk[4 * SPX_N]; // secret key
    uint8_t pk[2 * SPX_N]; // public key

    // generate secret/public key pair (not measured)
    int r1 = slh_keygen(sk, pk);
    assert(r1 == 0);

    size_t ctx_len = SPX_CTX_LEN; // context length
    size_t msg_len = SPX_MSG_LEN; // message length
    uint8_t ctx_ptr[ctx_len]; // context pointer
    uint8_t msg_ptr[msg_len]; // message pointer

    // generate random message and context (not measured)
    randombytes(ctx_ptr, SPX_CTX_LEN);
    randombytes(msg_ptr, SPX_MSG_LEN);

    uint64_t ctx_msg_ptrs[2]; // combined context and message pointers
    uint64_t ctx_msg_lens[2]; // combined context and message lengths

    ctx_msg_ptrs[0] = (uint64_t) ctx_ptr;
    ctx_msg_ptrs[1] = (uint64_t) msg_ptr;
    ctx_msg_lens[0] = (uint64_t) ctx_len;
    ctx_msg_lens[1] = (uint64_t) msg_len;

    bool deterministic = false; // choice of (non)deterministic message randomiser generation

    // generate signature (not measured)
    uint8_t sig[SPX_SIG_BYTES]; // signature
    int r2 = slh_sign(sig, ctx_msg_ptrs, ctx_msg_lens, sk, (uint8_t) deterministic);
    assert(r2 == 0);

    BENCHMARK_N_TIMES(TIMINGS, "bench/results/slh_dsa_verify.txt", slh_verify(ctx_msg_ptrs, ctx_msg_lens, sig, pk));
}

int main(void) {
    bench_slh_dsa_keygen();
    bench_slh_dsa_sign();
    bench_slh_dsa_verify();
    return EXIT_SUCCESS;
}