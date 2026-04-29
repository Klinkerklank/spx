#include <string.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "params/params.h" // contains SPX_N and SPX_SIG_BYTES, which Makefile defines based on PARAMSET

#define ANSI_COLOR_RESET   "\x1b[0m"
#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"

// declare the Jasmin export functions in spx.jazz
extern int slh_keygen(uint8_t *sk, uint8_t *pk);
extern int slh_sign(uint8_t *sig, uint64_t m_addr, uint64_t m_len, uint8_t *sk);
extern int slh_verify(uint64_t m_addr, uint64_t m_len, uint8_t *sig, uint8_t *pk);

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

int keygen() {
    uint8_t sk[4 * SPX_N];
    uint8_t pk[2 * SPX_N];

    int r = slh_keygen(sk, pk);
    assert(r == 0);

    // printf("SPHINCS+ secret key:");
    // for (int i=0; i < 4*SPX_N; i++) {
    //     if (i == 0 * 4*SPX_N/4) {
    //         printf("\n[SK.seed] ");
    //     } else if (i == 1 * 4*SPX_N/4) {
    //         printf("\n[SK.prf]  ");
    //     } else if (i == 2 * 4*SPX_N/4) {
    //         printf("\n[PK.seed] ");
    //     } else if (i == 3 * 4*SPX_N/4) {
    //         printf("\n[PK.root] ");
    //     }

    //     printf("%02X", sk[i]);
    //     if (i%2 == 1) {
    //         printf(" ");
    //     }
    // }
    // printf("\n\n");

    // printf("SPHINCS+ public key:");
    // for (int i=0; i < 2*SPX_N; i++) {
    //     if (i == 0 * 2*SPX_N/2) {
    //         printf("\n[PK.seed] ");
    //     } else if (i == 1 * 2*SPX_N/2) {
    //         printf("\n[PK.root] ");
    //     }

    //     printf("%02X", pk[i]);
    //     if (i%2 == 1) {
    //         printf(" ");
    //     }
    // }
    // printf("\n\n");
    
    mkdir("outputs", 0700); // ensure output directory exists
    write_file("outputs/sk.bin", sk, sizeof(sk)); // write sk to sk.bin
    write_file("outputs/pk.bin", pk, sizeof(pk)); // write pk to pk.bin

    printf("Keys written to outputs/sk.bin and outputs/pk.bin\n");

    return 0;
}

int sign(uint8_t *msg, size_t msg_len) {
    // read secret key from file
    uint8_t sk[4 * SPX_N];
    read_file_fixed("outputs/sk.bin", sk, sizeof(sk));
    
    // declare buffer that will hold the signature
    uint8_t sig[SPX_SIG_BYTES];
    
    int r = slh_sign(sig, (uint64_t)msg, (uint64_t)msg_len, sk);
    assert(r == 0);
    
    mkdir("outputs", 0700); // ensure output directory exists
    write_file("outputs/sig.bin", sig, sizeof(sig)); // write sig to sig.bin

    printf("Signature written to outputs/sig.bin\n");
    
    return 0;
}

int verify(uint8_t *msg, size_t msg_len) {
    // read public key from file
    uint8_t pk[2 * SPX_N];
    read_file_fixed("outputs/pk.bin", pk, sizeof(pk));
    
    // read signature from file
    uint8_t sig[SPX_SIG_BYTES];
    read_file_fixed("outputs/sig.bin", sig, sizeof(sig));

    int r = slh_verify((uint64_t)msg, (uint64_t)msg_len, sig, pk);
    
    printf("Verification: ");
    if (r == 0) {
        printf(ANSI_COLOR_GREEN "PASSED" ANSI_COLOR_RESET "\n");
    } else {
        printf(ANSI_COLOR_RED "FAILED" ANSI_COLOR_RESET "\n");
    }
    
    return r;
}

int main(int argc, char **argv) {
    char *mode = NULL;
    char *msgfile = NULL;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-mode") == 0) {
            mode = argv[++i];
        } else if (strcmp(argv[i], "-msg") == 0) {
            msgfile = argv[++i];
        }
    }

    if (!mode) {
        printf("Mode not defined. Usage:\n");
        printf("  -mode keygen\n");
        printf("  -mode sign   -msg <file>\n");
        printf("  -mode verify -msg <file>\n");
        return 1;
    }
    
    printf("\n");

    if (strcmp(mode, "keygen") == 0) {
        printf("Generating SPHINCS+ keys ...\n");

        keygen();
    }
    else if (strcmp(mode, "sign") == 0) {
        if (!msgfile) {
            printf("sign requires -msg\n");
            return 1;
        }
        printf("Computing signature on %s ...\n", msgfile);
        
        size_t msg_len;
        uint8_t *msg = read_file(msgfile, &msg_len);

        if (!msg) {
            printf("Failed to read file\n");
            return 1;
        }

        sign(msg, msg_len);

        free(msg);
    }
    else if (strcmp(mode, "verify") == 0) {
        if (!msgfile) {
            printf("verify requires -msg\n");
            return 1;
        }
        printf("Verifying signature on %s ...\n", msgfile);
        
        size_t msg_len;
        uint8_t *msg = read_file(msgfile, &msg_len);

        if (!msg) {
            printf("Failed to read file\n");
            return 1;
        }

        verify(msg, msg_len);

        free(msg);
    }
    else {
        printf("Unknown mode: %s\n", mode);
        return 1;
    }

    return 0;
}