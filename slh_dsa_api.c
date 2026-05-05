#include <stdint.h>
#include <stddef.h>

#include "x86-64/ref/params/params.h" // contains SPX_N and SPX_SIG_BYTES
#include "slh_dsa_api.h"              // declare the Jasmin export function signatures in spx.jazz

/* =========================
 * Key Generation
 * ========================= */
void slh_dsa_sha2_128s_keygen(
    uint8_t *pk,
    uint8_t *sk,
    uint8_t *randomness // unused for now
) {
    (void)randomness; // suppress unused warning

    // NOTE: your Jasmin expects (sk, pk)
    int r = slh_keygen(sk, pk);

    // You can add error handling if you want
    (void)r;
}

/* =========================
 * Sign
 * ========================= */
int slh_dsa_sha2_128s_sign(
    uint8_t *sig,
    uint8_t *sk,
    uint64_t context[2],   // [ptr, len]
    uint64_t msg_ptr,
    uint64_t msg_len,
    uint8_t *randomness
) {
    (void)randomness;  // deterministic variant already used

    // Directly pass pointer + length as your Jasmin expects
    return slh_sign(sig, context[0], context[1], msg_ptr, msg_len, sk);
}

/* =========================
 * Verify
 * ========================= */
int slh_dsa_sha2_128s_verify(
    uint8_t *pk,
    uint64_t context[2],
    uint64_t msg_ptr,
    uint64_t msg_len,
    uint8_t *sig
) {
    return slh_verify(context[0], context[1], msg_ptr, msg_len, sig, pk);
}