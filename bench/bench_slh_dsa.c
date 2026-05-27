#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>

#include "bench.h"
#include "randombytes.h"
#include "impl_ifaces/slh_dsa_iface.h"
#include "../params/params.h" // contains SPX_N and SPX_SIG_BYTES

// declare implementation interfaces
extern slh_dsa_impl jasmin_ref_impl;  // Jasmin reference implementation
extern slh_dsa_impl jasmin_avx2_impl; // Jasmin AVX2 implementation
extern slh_dsa_impl c_ref_impl;       // C reference implementation
extern slh_dsa_impl openssl_impl;     // OpenSSL implementation

#define TIMINGS 10
#define SPX_MSG_LEN 32
#define SPX_CTX_LEN 32

void benchmark_impls(
    const char *paramset,
    slh_dsa_impl *impl_jasmin_ref,
    slh_dsa_impl *impl_jasmin_avx2,
    slh_dsa_impl *impl_c_ref,
    slh_dsa_impl *impl_openssl
)
{
    char filename[256];

    uint8_t sk[4*SPX_N]; // secret key
    uint8_t pk[2*SPX_N]; // public key

    // generate key randomness
    uint8_t keyrnd[3*SPX_N]; // key randomness
    randombytes(keyrnd, 3*SPX_N);

    // keygen: benchmark the Jasmin reference implementation
    snprintf(filename, sizeof(filename), "bench/results/jasmin_ref_%s_keygen.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_jasmin_ref->keygen(sk, pk, keyrnd));

    // keygen: benchmark the Jasmin AVX2 implementation
    snprintf(filename, sizeof(filename), "bench/results/jasmin_avx2_%s_keygen.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_jasmin_avx2->keygen(sk, pk, keyrnd));

    // keygen: benchmark the C reference implementation
    snprintf(filename, sizeof(filename), "bench/results/c_ref_%s_keygen.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_c_ref->keygen(sk, pk, keyrnd));

    // keygen: benchmark the OpenSSL implementation
    snprintf(filename, sizeof(filename), "bench/results/openssl_%s_keygen.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_openssl->keygen(sk, pk, keyrnd));

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

    // sign: benchmark the Jasmin reference implementation
    snprintf(filename, sizeof(filename), "bench/results/jasmin_ref_%s_sign.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_jasmin_ref->sign(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, sk, addrnd));

    // sign: benchmark the Jasmin AVX2 implementation
    snprintf(filename, sizeof(filename), "bench/results/jasmin_avx2_%s_sign.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_jasmin_avx2->sign(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, sk, addrnd));

    // sign: benchmark the C reference implementation
    snprintf(filename, sizeof(filename), "bench/results/c_ref_%s_sign.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_c_ref->sign(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, sk, addrnd));

    // sign: benchmark the OpenSSL implementation
    snprintf(filename, sizeof(filename), "bench/results/openssl_%s_sign.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_openssl->sign(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, sk, addrnd));

    // verify: benchmark the Jasmin reference implementation
    snprintf(filename, sizeof(filename), "bench/results/jasmin_ref_%s_verify.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_jasmin_ref->verify(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, pk));

    // verify: benchmark the Jasmin AVX2 implementation
    snprintf(filename, sizeof(filename), "bench/results/jasmin_avx2_%s_verify.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_jasmin_avx2->verify(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, pk));

    // verify: benchmark the C reference implementation
    snprintf(filename, sizeof(filename), "bench/results/c_ref_%s_verify.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_c_ref->verify(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, pk));

    // verify: benchmark the OpenSSL implementation
    snprintf(filename, sizeof(filename), "bench/results/openssl_%s_verify.txt", paramset);
    BENCHMARK_N_TIMES(TIMINGS, filename, impl_openssl->verify(sig, msg_ptr, msg_len, ctx_ptr, ctx_len, pk));
}

int main(int argc, char **argv) {
    // get parameter set name
    const char *paramset = (argc > 1) ? argv[1] : "unknown";

    // initialise the persistent objects that the OpenSSL impl uses
    openssl_impl.init();

    benchmark_impls(paramset, &jasmin_ref_impl, &jasmin_avx2_impl, &c_ref_impl, &openssl_impl);

    // free the memory that OpenSSL has used
    openssl_impl.cleanup();
    
    return EXIT_SUCCESS;
}