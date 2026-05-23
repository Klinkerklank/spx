#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>

#include "bench.h"
#include "randombytes.h"
#include "impl_ifaces/slh_dsa_iface.h"
#include "../x86-64/ref/params/params.h" // contains SPX_N and SPX_SIG_BYTES

// declare implementation interfaces
extern slh_dsa_impl jasmin_ref_impl;
// extern slh_dsa_impl c_ref_impl;

#define TIMINGS 10
#define SPX_MSG_LEN 32
#define SPX_CTX_LEN 32

void benchmark_impl(slh_dsa_impl *impl)
{
    uint8_t sk[4*SPX_N]; // secret key
    uint8_t pk[2*SPX_N]; // public key

    // generate key randomness
    uint8_t keyrnd[3*SPX_N]; // key randomness
    randombytes(keyrnd, 3*SPX_N);

    // benchmark the Jasmin reference implementation
    BENCHMARK_N_TIMES(TIMINGS, "bench/results/jasmin_ref_keygen.txt", impl->keygen(sk, pk, keyrnd));

    // generate random message and context
    size_t ctx_len = SPX_CTX_LEN; // context length
    size_t msg_len = SPX_MSG_LEN; // message length
    uint8_t ctx_ptr[ctx_len]; // context pointer
    uint8_t msg_ptr[msg_len]; // message pointer
    randombytes(ctx_ptr, SPX_CTX_LEN);
    randombytes(msg_ptr, SPX_MSG_LEN);

    // generate random message and context
    randombytes(ctx_ptr, SPX_CTX_LEN);
    randombytes(msg_ptr, SPX_MSG_LEN);

    // generate additional message randomness
    uint8_t addrnd[SPX_N]; // key randomness
    randombytes(addrnd, SPX_N);
    
    uint8_t sig[SPX_SIG_BYTES]; // signature buffer

    // benchmark the Jasmin reference implementation
    BENCHMARK_N_TIMES(TIMINGS, "bench/results/jasmin_ref_sign.txt", impl->sign(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, sk, addrnd));

    // benchmark the Jasmin reference implementation
    BENCHMARK_N_TIMES(TIMINGS, "bench/results/jasmin_ref_verify.txt", impl->verify(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, pk));
}

int main(void) {
    benchmark_impl(&jasmin_ref_impl);
    
    return EXIT_SUCCESS;
}