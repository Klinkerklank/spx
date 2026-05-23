// INCLUDES?
#include "slh_dsa_iface.h" // contains the abstract interface wrapper

static int c_ref_keygen(
    uint8_t *sk,
    uint8_t *pk,
    const uint8_t *keyrnd
)
{
    return crypto_sign_seed_keypair(pk, sk, keyrnd);
}

static int c_ref_sign(
    uint8_t *sig,
    const uint8_t *msg,
    size_t msg_len,
    const uint8_t *ctx,
    size_t ctx_len,
    const uint8_t *sk,
    const uint8_t *addrnd
)
{
    return crypto_sign_signature(sig, SPX_SIG_BYTES, msg_ptr, msg_len, sk);
}

static int c_ref_verify(
    const uint8_t *sig,
    const uint8_t *msg,
    size_t msg_len,
    const uint8_t *ctx,
    size_t ctx_len,
    const uint8_t *pk
)
{
    return crypto_sign_verify(sig, SPX_SIG_BYTES, msg_ptr, msg_len, pk);
}

slh_dsa_impl c_ref_impl = {
    .name = "c_ref",
    .keygen = c_ref_keygen,
    .sign = c_ref_sign,
    .verify = c_ref_verify
};