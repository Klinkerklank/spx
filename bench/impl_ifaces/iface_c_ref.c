#include "../../slh_dsa_cli.h"
#include "../slh_dsa_iface.h"

static int cref_keygen(uint8_t *sk, uint8_t *pk)
{
    return crypto_sign_keypair(pk, sk);
}

static int jasmin_sign(
    uint8_t *sig,
    const uint8_t *msg,
    size_t msg_len,
    const uint8_t *ctx,
    size_t ctx_len,
    const uint8_t *sk
)
{
    uint64_t ptrs[2];
    uint64_t lens[2];

    ptrs[0] = (uint64_t)ctx;
    ptrs[1] = (uint64_t)msg;

    lens[0] = ctx_len;
    lens[1] = msg_len;

    return slh_sign(sig, ptrs, lens, sk, 0);
}

slh_dsa_impl jasmin_impl = {
    .name = "jasmin",
    .keygen = jasmin_keygen,
    .sign = jasmin_sign,
    .verify = jasmin_verify
};