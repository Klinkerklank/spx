#include <openssl/evp.h>
#include <openssl/core_names.h>

#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

#include "slh_dsa_iface.h" // contains the abstract interface wrapper

#include "../../x86-64/ref/params/params.h" // contains SPX_N and SPX_SIG_BYTES

// persistent OpenSSL key objects
static EVP_PKEY *openssl_pkey = NULL;

static int openssl_keygen(
    uint8_t *sk,
    uint8_t *pk,
    const uint8_t *keyrnd
)
{
    (void)sk;
    (void)pk;
    (void)keyrnd;

    EVP_PKEY_CTX *ctx = NULL;

    // free previous key if benchmark reruns
    EVP_PKEY_free(openssl_pkey);
    openssl_pkey = NULL;

    const char *alg = OPENSSL_PARAMSET;
    if (!alg) {
        printf("ERROR: unsupported paramset %s\n", OPENSSL_PARAMSET);
        goto err;
    }

    ctx = EVP_PKEY_CTX_new_from_name(NULL, alg, NULL);

    if (!ctx) {
        printf("ERROR: EVP_PKEY_CTX_new_from_name\n");
        goto err;
    }

    if (EVP_PKEY_keygen_init(ctx) <= 0) {
        printf("ERROR: EVP_PKEY_keygen_init\n");
        goto err;
    }

    if (EVP_PKEY_keygen(ctx, &openssl_pkey) <= 0) {
        printf("ERROR: EVP_PKEY_keygen\n");
        goto err;
    }

    EVP_PKEY_CTX_free(ctx);

    return 0;

err:
    EVP_PKEY_CTX_free(ctx);
    EVP_PKEY_free(openssl_pkey);
    openssl_pkey = NULL;

    return -1;
}

static int openssl_sign(
    uint8_t *sig,
    const uint8_t *msg_ptr,
    size_t msg_len,
    const uint8_t *ctx_ptr,
    size_t ctx_len,
    const uint8_t *sk,
    const uint8_t *addrnd
)
{
    (void)sk;
    (void)addrnd;

    EVP_MD_CTX *mdctx = NULL;
    EVP_PKEY_CTX *pctx = NULL;

    size_t siglen = 0;

    if (!openssl_pkey) {
        printf("ERROR: no OpenSSL key loaded\n");
        return -1;
    }

    mdctx = EVP_MD_CTX_new();
    if (!mdctx) {
        printf("ERROR: EVP_MD_CTX_new\n");
        goto err;
    }

    if (EVP_DigestSignInit_ex(
            mdctx,
            &pctx,
            NULL,
            NULL,
            NULL,
            openssl_pkey,
            NULL) <= 0) {
        printf("ERROR: EVP_DigestSignInit_ex\n");
        goto err;
    }

    // query signature length
    if (EVP_DigestSign(
            mdctx,
            NULL,
            &siglen,
            msg_ptr,
            msg_len) <= 0) {
        printf("ERROR: EVP_DigestSign(size query)\n");
        goto err;
    }

    // actual signing
    if (EVP_DigestSign(
            mdctx,
            sig,
            &siglen,
            msg_ptr,
            msg_len) <= 0) {
        printf("ERROR: EVP_DigestSign\n");
        goto err;
    }

    EVP_MD_CTX_free(mdctx);

    return 0;

err:
    EVP_MD_CTX_free(mdctx);
    return -1;
}

static int openssl_verify(
    const uint8_t *sig,
    const uint8_t *msg_ptr,
    size_t msg_len,
    const uint8_t *ctx_ptr,
    size_t ctx_len,
    const uint8_t *pk
)
{
    (void)pk;

    EVP_MD_CTX *mdctx = NULL;
    EVP_PKEY_CTX *pctx = NULL;

    if (!openssl_pkey) {
        printf("ERROR: no OpenSSL key loaded\n");
        return -1;
    }

    mdctx = EVP_MD_CTX_new();
    if (!mdctx) {
        printf("ERROR: EVP_MD_CTX_new\n");
        goto err;
    }

    if (EVP_DigestVerifyInit_ex(
            mdctx,
            &pctx,
            NULL,
            NULL,
            NULL,
            openssl_pkey,
            NULL) <= 0) {
        printf("ERROR: EVP_DigestVerifyInit_ex\n");
        goto err;
    }

    int ret = EVP_DigestVerify(
        mdctx,
        sig,
        SPX_SIG_BYTES,
        msg_ptr,
        msg_len
    );

    EVP_MD_CTX_free(mdctx);

    if (ret == 1) {
        return 0;
    }

    return -1;

err:
    EVP_MD_CTX_free(mdctx);
    return -1;
}

slh_dsa_impl openssl_impl = {
    .name = "openssl",
    .keygen = openssl_keygen,
    .sign = openssl_sign,
    .verify = openssl_verify
};