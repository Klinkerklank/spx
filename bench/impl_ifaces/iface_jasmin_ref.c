#include "../../x86-64/ref/params/params.h" // contains SPX_N and SPX_SIG_BYTES
#include "../../slh_dsa_cli.h"              // declare the Jasmin export function signatures in spx.jazz
#include "slh_dsa_iface.h"                  // contains the abstract interface wrapper

static int jasmin_ref_keygen(
    uint8_t *sk,
    uint8_t *pk,
    const uint8_t *keyrnd
)
{
    return slh_keygen_internal(sk, pk, keyrnd);
}

static int jasmin_ref_sign(
    uint8_t *sig,
    const uint8_t *msg_ptr,
    size_t msg_len,
    const uint8_t *ctx_ptr,
    size_t ctx_len,
    const uint8_t *sk,
    const uint8_t *addrnd
)
{
    uint64_t ctx_msg_ptrs[2];
    uint64_t ctx_msg_lens[2];

    ctx_msg_ptrs[0] = (uint64_t)ctx_ptr;
    ctx_msg_ptrs[1] = (uint64_t)msg_ptr;

    ctx_msg_lens[0] = ctx_len;
    ctx_msg_lens[1] = msg_len;

    return slh_sign_internal(sig, ctx_msg_ptrs, ctx_msg_lens, sk, addrnd);
}

static int jasmin_ref_verify(
    const uint8_t *sig,
    const uint8_t *msg_ptr,
    size_t msg_len,
    const uint8_t *ctx_ptr,
    size_t ctx_len,
    const uint8_t *pk
)
{
    uint64_t ctx_msg_ptrs[2];
    uint64_t ctx_msg_lens[2];

    ctx_msg_ptrs[0] = (uint64_t)ctx_ptr;
    ctx_msg_ptrs[1] = (uint64_t)msg_ptr;

    ctx_msg_lens[0] = ctx_len;
    ctx_msg_lens[1] = msg_len;

    return slh_verify_internal(ctx_msg_ptrs, ctx_msg_lens, sig, pk);
}

slh_dsa_impl jasmin_ref_impl = {
    .name = "jasmin_ref",
    .keygen = jasmin_ref_keygen,
    .sign = jasmin_ref_sign,
    .verify = jasmin_ref_verify
};