// modified from https://github.com/formosa-crypto/formosa-xmss/blob/52beaa1c7669d479aceb6d9b2b998f701b6c9418/bench/common/bench.h

#ifndef BENCHMARK_H
#define BENCHMARK_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Check for __attribute__((cleanup)) support
#if !defined(__GNUC__) && !defined(__clang__)
#error "This code requires GCC or Clang for __attribute__((cleanup)) support"
#endif

// From https://github.com/formosa-crypto/formosa-mldsa/blob/main/bench/bench_jasmin.c
static inline uint64_t cpucycles(void) {
    uint64_t result;

    asm volatile("rdtsc; shlq $32,%%rdx; orq %%rdx,%%rax" : "=a"(result) : : "%rdx");

    return result;
}

// From https://github.com/formosa-crypto/formosa-mldsa/blob/main/bench/bench_jasmin.c
static int cmp_uint64(const void *a, const void *b) {
#ifdef DEBUG
    if (a == NULL && b == NULL) {
        perror("cmp_uint64: both arguments are NULL");
        return 0;
    }

    if (a == NULL) {
        perror("cmp_uint64: first argument is NULL");
        return 0;
    }

    if (b == NULL) {
        perror("cmp_uint64: second argument is NULL");
        return 0;
    }
#endif

    if (*(uint64_t *)a < *(uint64_t *)b) {
        return -1;
    }
    if (*(uint64_t *)a > *(uint64_t *)b) {
        return 1;
    }

    return 0;
}

// From https://github.com/formosa-crypto/formosa-mldsa/blob/main/bench/bench_jasmin.c
static uint64_t median(uint64_t *l, size_t llen) {
#ifdef DEBUG
    if (l == NULL) {
        perror("median: pointer argument is NULL");
        return 0;
    }
#endif

    qsort(l, llen, sizeof(uint64_t), cmp_uint64);

    if (llen % 2) {
        return l[llen / 2];
    } else {
        return (l[llen / 2 - 1] + l[llen / 2]) / 2;
    }
}

// From https://github.com/formosa-crypto/formosa-mldsa/blob/main/bench/bench_jasmin.c
static uint64_t average(uint64_t *t, size_t tlen) {
#ifdef DEBUG
    if (t == NULL) {
        perror("average: pointer argument is NULL");
        return 0;
    }
#endif

    size_t i;
    uint64_t acc = 0;

    for (i = 0; i < tlen; i++) {
        acc += t[i];
    }

    return acc / tlen;
}

static uint64_t overhead_of_cpucycles_call(void) {
    uint64_t t0, t1, overhead = -1LL;
    unsigned int i;

    for (i = 0; i < 100000; i++) {
        t0 = cpucycles();
        __asm__ volatile("");
        t1 = cpucycles();
        if (t1 - t0 < overhead) {
            overhead = t1 - t0;
        }
    }

    return overhead;
}

/*
 * Cleanup function for automatic fclose using __attribute__((cleanup))
 */
static inline void cleanup_fclose(FILE **fpp) {
    if (fpp && *fpp) {
        fclose(*fpp);
    } else {
        fprintf(stderr, "cleanup_fclose: invalid FILE pointer\n");
    }
}

/*
 * This macro benchmarks a function call `N` times and writes the
 * raw clock cycle counts for each execution to a file.
 *
 * Usage:
 *   BENCHMARK_N_TIMES(1000, "results.txt", my_function(arg1));
 */
#define BENCHMARK_N_TIMES(N, filename, func_call)                                            \
    do {                                                                                     \
        /* ensure output directory exists */                                                 \
        char _cmd[512];                                                                      \
        snprintf(_cmd, sizeof(_cmd), "mkdir -p $(dirname %s)", filename);                    \
        system(_cmd);                                                                        \
                                                                                             \
        FILE *fp __attribute__((cleanup(cleanup_fclose))) = fopen(filename, "w");            \
        if (fp == NULL) {                                                                    \
            fprintf(stderr, "Failed to open file for benchmarking results: %s: ", filename); \
            perror("");                                                                      \
            break;                                                                           \
        }                                                                                    \
                                                                                             \
        for (int i = 0; i < (N); ++i) {                                                      \
            unsigned long long start_cycles, end_cycles;                                     \
            start_cycles = cpucycles();                                                      \
            func_call;                                                                       \
            end_cycles = cpucycles();                                                        \
            fprintf(fp, "%llu\n", end_cycles - start_cycles);                                \
        }                                                                                    \
        printf("Benchmark results for %d executions written to '%s'\n", (N), (filename));    \
    } while (0)

// performs the given functions in an interleaved fashion and with a cache-warmed start,
// and writes the measured clock cycles to their respective files
#define BENCHMARK_INTERLEAVED_ABCD(N, action, file_a, func_call_a, file_b, func_call_b, file_c, func_call_c, file_d, func_call_d) \
    do {                                                                                    \
        /* ensure output directory exists */                                                \
        char _cmd[512];                                                                     \
        snprintf(_cmd, sizeof(_cmd), "mkdir -p $(dirname %s)", file_a);                     \
        system(_cmd);                                                                       \
                                                                                            \
        snprintf(_cmd, sizeof(_cmd), "mkdir -p $(dirname %s)", file_b);                     \
        system(_cmd);                                                                       \
                                                                                            \
        snprintf(_cmd, sizeof(_cmd), "mkdir -p $(dirname %s)", file_c);                     \
        system(_cmd);                                                                       \
                                                                                            \
        snprintf(_cmd, sizeof(_cmd), "mkdir -p $(dirname %s)", file_d);                     \
        system(_cmd);                                                                       \
                                                                                            \
        FILE *fp_a __attribute__((cleanup(cleanup_fclose))) = fopen(file_a, "w");           \
        FILE *fp_b __attribute__((cleanup(cleanup_fclose))) = fopen(file_b, "w");           \
        FILE *fp_c __attribute__((cleanup(cleanup_fclose))) = fopen(file_c, "w");           \
        FILE *fp_d __attribute__((cleanup(cleanup_fclose))) = fopen(file_d, "w");           \
                                                                                            \
        if (fp_a == NULL || fp_b == NULL || fp_c == NULL || fp_d == NULL) {                 \
            fprintf(stderr, "Failed to open benchmark output files\n");                     \
            perror("");                                                                     \
            break;                                                                          \
        }                                                                                   \
                                                                                            \
        /* cold start (without measuring) to hopefully reduce variability */                \
        for (int i = 0; i < (10); ++i) {                                                    \
            func_call_a;                                                                    \
            func_call_b;                                                                    \
            func_call_c;                                                                    \
            func_call_d;                                                                    \
        }                                                                                   \
                                                                                            \
        for (int i = 0; i < (N); ++i) {                                                     \
            unsigned long long start_cycles, end_cycles;                                    \
                                                                                            \
            /* ---- A ---- */                                                               \
            start_cycles = cpucycles();                                                     \
            func_call_a;                                                                    \
            end_cycles = cpucycles();                                                       \
            fprintf(fp_a, "%llu\n", end_cycles - start_cycles);                             \
                                                                                            \
            /* ---- B ---- */                                                               \
            start_cycles = cpucycles();                                                     \
            func_call_b;                                                                    \
            end_cycles = cpucycles();                                                       \
            fprintf(fp_b, "%llu\n", end_cycles - start_cycles);                             \
                                                                                            \
            /* ---- C ---- */                                                               \
            start_cycles = cpucycles();                                                     \
            func_call_c;                                                                    \
            end_cycles = cpucycles();                                                       \
            fprintf(fp_c, "%llu\n", end_cycles - start_cycles);                             \
                                                                                            \
            /* ---- D ---- */                                                               \
            start_cycles = cpucycles();                                                     \
            func_call_d;                                                                    \
            end_cycles = cpucycles();                                                       \
            fprintf(fp_d, "%llu\n", end_cycles - start_cycles);                             \
        }                                                                                   \
                                                                                            \
        printf("Interleaved benchmarking (%d rounds) written for action '%s'\n",            \
               (N), (action));                                                              \
    } while (0)

#endif  // BENCHMARK_H
