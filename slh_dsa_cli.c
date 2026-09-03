#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#include "params/params.h" // contains SPX_N and SPX_SIG_BYTES
#include "slh_dsa_api_ref.h" // contains the Jasmin export function signatures in spx.jazz

#define ANSI_COLOR_RESET  "\x1b[0m"
#define ANSI_COLOR_RED    "\x1b[31m"
#define ANSI_COLOR_GREEN  "\x1b[32m"
#define ANSI_COLOR_YELLOW "\x1b[33m"
#define ANSI_COLOR_CYAN   "\x1b[36m"

// helper functions //

void write_file(const char *path, uint8_t *data, size_t len) {
    FILE *f = fopen(path, "wb");
    if (!f) {
        perror("fopen");
    }

    size_t written = fwrite(data, 1, len, f);
    if (written != len) {
        perror("fwrite");
        fclose(f);
    }

    fclose(f);
}

void read_file_fixed(const char *path, uint8_t *buf, size_t expected_len) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        perror("fopen");
    }

    size_t read = fread(buf, 1, expected_len, f);
    if (read != expected_len) {
        printf("Error: expected %zu bytes, got %zu\n", expected_len, read);
        fclose(f);
    }

    fclose(f);
}

uint8_t *read_file(const char *path, size_t *len_out) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        perror("fopen");
        return NULL;
    }

    // Get file size
    if (fseek(f, 0, SEEK_END) != 0) {
        perror("fseek");
        fclose(f);
        return NULL;
    }

    long len = ftell(f);
    if (len < 0) {
        perror("ftell");
        fclose(f);
        return NULL;
    }

    rewind(f);

    // allocate buffer
    uint8_t *buf = malloc((size_t)len);
    if (!buf) {
        perror("malloc");
        fclose(f);
        return NULL;
    }

    // read file
    size_t read = fread(buf, 1, (size_t)len, f);
    if (read != (size_t)len) {
        fprintf(stderr, "Error: expected %ld bytes, got %zu\n", len, read);
        free(buf);
        fclose(f);
        return NULL;
    }

    fclose(f);

    *len_out = (size_t)len;
    return buf;
}

// main functions //

int keygen() {
    uint8_t sk[4 * SPX_N];
    uint8_t pk[2 * SPX_N];

    int r = slh_keygen(sk, pk);
    assert(r == 0);
    
    mkdir("outputs", 0700); // ensure output directory exists
    write_file("outputs/sk.bin", sk, sizeof(sk)); // write sk to sk.bin
    write_file("outputs/pk.bin", pk, sizeof(pk)); // write pk to pk.bin

    printf("Keys written to outputs/sk.bin and outputs/pk.bin\n\n");

    return 0;
}

int sign(uint8_t *ctx_ptr, size_t ctx_len, uint8_t *msg_ptr, size_t msg_len, bool deterministic) {
    // read secret key from file
    uint8_t sk[4 * SPX_N];
    read_file_fixed("outputs/sk.bin", sk, sizeof(sk));
    
    // declare buffer that will hold the signature
    uint8_t sig[SPX_SIG_BYTES];

    uint64_t ctx_msg_ptrs[2];
    uint64_t ctx_msg_lens[2];

    ctx_msg_ptrs[0] = (uint64_t) ctx_ptr;
    ctx_msg_ptrs[1] = (uint64_t) msg_ptr;
    ctx_msg_lens[0] = (uint64_t) ctx_len;
    ctx_msg_lens[1] = (uint64_t) msg_len;
    
    int r = slh_sign(sig, ctx_msg_ptrs, ctx_msg_lens, sk, (uint8_t) deterministic);
    assert(r == 0);
    
    mkdir("outputs", 0700); // ensure output directory exists
    write_file("outputs/sig.bin", sig, sizeof(sig)); // write sig to sig.bin

    printf("Signature written to outputs/sig.bin\n\n");
    
    return 0;
}

int verify(uint8_t *ctx_ptr, size_t ctx_len, uint8_t *msg_ptr, size_t msg_len) {
    // read public key from file
    uint8_t pk[2 * SPX_N];
    read_file_fixed("outputs/pk.bin", pk, sizeof(pk));
    
    // read signature from file
    uint8_t sig[SPX_SIG_BYTES];
    read_file_fixed("outputs/sig.bin", sig, sizeof(sig));

    uint64_t ctx_msg_ptrs[2];
    uint64_t ctx_msg_lens[2];

    ctx_msg_ptrs[0] = (uint64_t) ctx_ptr;
    ctx_msg_ptrs[1] = (uint64_t) msg_ptr;
    ctx_msg_lens[0] = (uint64_t) ctx_len;
    ctx_msg_lens[1] = (uint64_t) msg_len;

    int r = slh_verify(ctx_msg_ptrs, ctx_msg_lens, sig, pk);
    
    printf("Verification: ");
    if (r == 0) {
        printf(ANSI_COLOR_GREEN "PASSED" ANSI_COLOR_RESET "\n\n");
    } else {
        printf(ANSI_COLOR_RED "FAILED" ANSI_COLOR_RESET "\n\n");
    }
    
    return r;
}

void help() {
    printf(ANSI_COLOR_CYAN "SPHINCS+ Command-Line Interface ./cli\n" ANSI_COLOR_RESET);
    printf("modes: keygen, sign, and verify\n");
    printf("\n");
    printf("-> " ANSI_COLOR_CYAN "keygen" ANSI_COLOR_RESET " generates a pair of secret- and public keys.\n");
    printf("  the secret- and public keys are written to outputs/sk.bin and outputs/pk.bin respectively.\n");
    printf("  parameters:\n");
    printf("    (none)\n");
    printf("  example usage:\n");
    printf("    " ANSI_COLOR_YELLOW "./cli -mode keygen\n" ANSI_COLOR_RESET);
    printf("\n");
    printf("-> " ANSI_COLOR_CYAN "sign" ANSI_COLOR_RESET " signs a message.\n");
    printf("  uses the secret- and public keys in outputs/sk.bin and outputs/pk.bin.\n");
    printf("  signature is written to outputs/sig.bin.\n");
    printf("  parameters:\n");
    printf("    -msg <filepath> = the file path to the file to sign (required)\n");
    printf("    -ctx \"<string>\" = the context string (default: \"\")\n");
    printf("    -det <bool> = whether to use deterministic additional randomness (default: false)\n");
    printf("  example usage:\n");
    printf("    " ANSI_COLOR_YELLOW "./cli -mode sign -ctx \"context\" -msg README.md\n" ANSI_COLOR_RESET);
    printf("    " ANSI_COLOR_YELLOW "./cli -mode sign -msg slh_dsa_cli.c -det true\n" ANSI_COLOR_RESET);
    printf("\n");
    printf("-> " ANSI_COLOR_CYAN "verify" ANSI_COLOR_RESET " verifies a message.\n");
    printf("  uses the public key in outputs/pk.bin and signature in outputs/sig.bin.\n");
    printf("  parameters:\n");
    printf("    -msg <filepath> = the file path to the file to sign (required)\n");
    printf("    -ctx \"<string>\" = the context string (default: \"\")\n");
    printf("  example usage:\n");
    printf("    " ANSI_COLOR_YELLOW "./cli -mode verify -ctx \"context\" -msg README.md\n" ANSI_COLOR_RESET);
    printf("    " ANSI_COLOR_YELLOW "./cli -mode verify -msg slh_dsa_cli.c\n" ANSI_COLOR_RESET);
    printf("\n");
}

int main(int argc, char **argv) {
    char *mode = NULL;
    char *msg_file = NULL;
    char *ctx_ptr = "";
    bool deterministic = false;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-mode") == 0) {
            mode = argv[++i];
        } else if (strcmp(argv[i], "-msg") == 0) {
            msg_file = argv[++i];
        } else if (strcmp(argv[i], "-ctx") == 0) {
            ctx_ptr = argv[++i];
        } else if (strcmp(argv[i], "-det") == 0) {
            deterministic = argv[++i];
        } else if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
            help();
            return 0;
        }
    }

    if (!mode) {
        printf(ANSI_COLOR_RED "Mode not defined.\n" ANSI_COLOR_RESET);
        help();
        return 1;
    }
    
    printf("\n");

    if (strcmp(mode, "keygen") == 0) {
        printf(ANSI_COLOR_YELLOW "Generating SPHINCS+ keys" ANSI_COLOR_RESET "...\n");

        keygen();
    }
    else if (strcmp(mode, "sign") == 0) {
        if (!msg_file) {
            printf("sign requires -msg\n");
            return 1;
        }
        printf(ANSI_COLOR_YELLOW "Computing signature on %s" ANSI_COLOR_RESET "...\n", msg_file);
        
        size_t msg_len;
        uint8_t *msg_ptr = read_file(msg_file, &msg_len);

        if (!msg_ptr) {
            printf("Failed to read file\n");
            return 1;
        }
        
        size_t ctx_len = strlen(ctx_ptr);

        sign(ctx_ptr, ctx_len, msg_ptr, msg_len, deterministic);

        free(msg_ptr);
    }
    else if (strcmp(mode, "verify") == 0) {
        if (!msg_file) {
            printf("verify requires -msg\n");
            return 1;
        }
        printf(ANSI_COLOR_YELLOW "Verifying signature on %s" ANSI_COLOR_RESET "...\n", msg_file);
        
        size_t msg_len;
        uint8_t *msg_ptr = read_file(msg_file, &msg_len);

        if (!msg_ptr) {
            printf("Failed to read file\n");
            return 1;
        }
        
        size_t ctx_len = strlen(ctx_ptr);

        verify(ctx_ptr, ctx_len, msg_ptr, msg_len);

        free(msg_ptr);
    }

    return 0;
}