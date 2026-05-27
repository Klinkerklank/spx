#include <openssl/evp.h>
#include <openssl/core_names.h>

#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

#include "slh_dsa_iface.h" // contains the abstract interface wrapper

#include "../../params/params.h" // contains SPX_N and SPX_SIG_BYTES

// persistent OpenSSL key pair
static EVP_PKEY *openssl_pkey = NULL;

// persistent OpenSSL parameter set context
static EVP_PKEY_CTX *pk_ctx = NULL;

// persistent OpenSSL message digest contexts
static EVP_MD_CTX *sign_md_ctx = NULL;
static EVP_MD_CTX *verify_md_ctx = NULL;

void openssl_cleanup(void)
{
    EVP_PKEY_free(openssl_pkey);
    EVP_PKEY_CTX_free(pk_ctx);
    EVP_MD_CTX_free(sign_md_ctx);
    EVP_MD_CTX_free(verify_md_ctx);
    openssl_pkey = NULL;
    pk_ctx = NULL;
    sign_md_ctx = NULL;
    verify_md_ctx = NULL;
}

int openssl_init(void)
{
    const char *paramset = OPENSSL_PARAMSET;
    
    if (!paramset) {
        printf("ERROR: unsupported paramset: %s\n", OPENSSL_PARAMSET);
        goto err;
    }

    pk_ctx = EVP_PKEY_CTX_new_from_name(NULL, paramset, NULL);
    if (!pk_ctx) {
        printf("ERROR: EVP_PKEY_CTX_new_from_name: %s\n", paramset);
        goto err;
    }

    if (EVP_PKEY_keygen_init(pk_ctx) <= 0) {
        printf("ERROR: EVP_PKEY_keygen_init\n");
        goto err;
    }

    if (EVP_PKEY_CTX_set_group_name(pk_ctx, paramset) <= 0) {
        printf("ERROR: EVP_PKEY_CTX_set_group_name: %s\n", paramset);
        goto err;
    }

    // ensure there is a valid key in pk_ctx, in case keygen is not run before sign or verify
    if (EVP_PKEY_keygen(pk_ctx, &openssl_pkey) <= 0) {
        printf("ERROR: initial EVP_PKEY_keygen\n");
        goto err;
    }

    sign_md_ctx = EVP_MD_CTX_new();
    if (!sign_md_ctx) {
        printf("ERROR: EVP_MD_CTX_new\n");
        goto err;
    }

    verify_md_ctx = EVP_MD_CTX_new();
    if (!verify_md_ctx) {
        printf("ERROR: EVP_MD_CTX_new\n");
        goto err;
    }

    return 0;

err:
    openssl_cleanup();
    return -1;
}

static int openssl_keygen(
    uint8_t *sk,
    uint8_t *pk,
    const uint8_t *keyrnd
)
{
    EVP_PKEY *tmp_pkey = NULL;

    if (EVP_PKEY_keygen(pk_ctx, &tmp_pkey) <= 0) {
        printf("ERROR: EVP_PKEY_keygen\n");
        goto err;
    }

    EVP_PKEY_free(tmp_pkey);

    return 0;

err:
    EVP_PKEY_free(tmp_pkey);
    openssl_cleanup();
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
    size_t siglen = SPX_SIG_BYTES;

    EVP_MD_CTX_reset(sign_md_ctx);

    if (EVP_DigestSignInit_ex(
            sign_md_ctx,
            NULL,
            NULL,
            NULL,
            NULL,
            openssl_pkey,
            NULL) <= 0) {
        printf("ERROR: EVP_DigestSignInit_ex\n");
        goto err;
    }

    if (EVP_DigestSign(
            sign_md_ctx,
            sig,
            &siglen,
            msg_ptr,
            msg_len) <= 0) {
        printf("ERROR: EVP_DigestSign\n");
        goto err;
    }

    return 0;

err:
    openssl_cleanup();
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
    EVP_MD_CTX_reset(verify_md_ctx);

    if (EVP_DigestVerifyInit_ex(
            verify_md_ctx,
            NULL,
            NULL,
            NULL,
            NULL,
            openssl_pkey,
            NULL) <= 0) {
        printf("ERROR: EVP_DigestVerifyInit_ex\n");
        goto err;
    }

    int ret = EVP_DigestVerify(
        verify_md_ctx,
        sig,
        SPX_SIG_BYTES,
        msg_ptr,
        msg_len
    );

    return (ret == 1) ? 0 : -1;

err:
    openssl_cleanup();
    return -1;
}

slh_dsa_impl openssl_impl = {
    .name = "openssl",
    .init = openssl_init,
    .cleanup = openssl_cleanup,
    .keygen = openssl_keygen,
    .sign = openssl_sign,
    .verify = openssl_verify
};