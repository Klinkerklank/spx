#ifndef SLH_DSA_IFACE_H
#define SLH_DSA_IFACE_H

#include <stddef.h>
#include <stdint.h>

typedef struct {
    const char *name;

    int (*init)(void);
    void (*cleanup)(void);

    int (*keygen)(
        uint8_t *sk,
        uint8_t *pk,
        const uint8_t *keyrnd
    );

    int (*sign)(
        uint8_t *sig,
        const uint8_t *msg_ptr,
        size_t msg_len,
        const uint8_t *ctx_ptr,
        size_t ctx_len,
        const uint8_t *sk,
        const uint8_t *addrnd
    );

    int (*verify)(
        const uint8_t *sig,
        const uint8_t *msg_ptr,
        size_t msg_len,
        const uint8_t *ctx_ptr,
        size_t ctx_len,
        const uint8_t *pk
    );

} slh_dsa_impl;

#endif