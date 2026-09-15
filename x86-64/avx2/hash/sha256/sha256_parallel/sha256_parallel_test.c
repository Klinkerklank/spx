
#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

#define NUM_HASHES 8
#define HASH_BYTES 32

extern int sha256_parallel_test(
    uint64_t out_ptr
);

int main(void)
{
    /*
     * output buffer:
     *
     * out[0*32 .. 0*32+31] = hash 0
     * out[1*32 .. 1*32+31] = hash 1
     * ...
     * out[7*32 .. 7*32+31] = hash 7
     */
    uint8_t out[NUM_HASHES][HASH_BYTES] = {0};

    // Jasmin uses an integer type for pointer arguments,
    // so cast the address of the output buffer to uint64_t
    
    uint64_t out_ptr = (uint64_t)(uintptr_t)out;

    int r = sha256_parallel_test(out_ptr);

    if (r != 0) {
        fprintf(stderr, "sha256_parallel_test failed: %d\n", r);
        return r;
    }

    /* print one SHA-256 digest per line. */
    for (int i = 0; i < NUM_HASHES; i++) {
        printf("hash %d: ", i+1);

        for (int j = 0; j < HASH_BYTES; j++) {
            printf("%02x", out[i][j]);
        }

        printf("\n");
    }

    // printf("\nexpect: b413f47d13ee2fe6c845b2ee141af81de858df4ec549a58b7970bb96645bc8d2\n");

    return 0;
}
