# ---------------------------------------------------------------- #
#  SETTINGS                                                        #
# ---------------------------------------------------------------- #

# command line options to provide
ARCHITECTURE ?= x86-64
IMPLEMENTATION_TYPE ?= avx2
PARAMETER_SET ?= shake-256f

# compiler settings
JASMINC = jasmin/compiler/jasminc
JASMINFLAGS = -I Keccak=formosa-keccak/src/amd64
CC = /usr/bin/gcc

# fixed-location files
PARAM_HEADER = params/params.h
CLI = cli
BENCH = bench/slh_dsa_bench

# parameter sets
IMPLEMENTATIONS = ref avx2
PARAMETER_SETS = \
	sha2-128f sha2-128s \
	sha2-192f sha2-192s \
	sha2-256f sha2-256s \
	shake-128f shake-128s \
	shake-192f shake-192s \
	shake-256f shake-256s

# testing settings
GROUPED_JSONS = $(addprefix tests/acvp/grouped/slh_dsa_, \
	$(addsuffix .json,$(PARAMETER_SETS)))

# ---------------------------------------------------------------- #
#  STANDARD MAKEFILE STUFF                                         #
# ---------------------------------------------------------------- #

# prevent extraneous print statements that make the output cluttered
MAKEFLAGS += --no-print-directory

# default behaviour
all: acvp-kat-test-all

# clean build artifacts
.PHONY: clean
clean:
	@rm -rf \
		slh_dsa_*.s slh_dsa_*.o slh_dsa_*.so \
		params/params.h \
		x86-64/ref/active_params.jinc \
		x86-64/avx2/active_params.jinc \
		cli outputs \
		.pytest_cache tests/__pycache__ \
		bench/slh_dsa_bench \
		bench/impls/*.a \
		bench/results \
		sphincsplus/ref/*.o

# ---------------------------------------------------------------- #
#  PARAMETER HANDLING                                              #
# ---------------------------------------------------------------- #

# set the correct values of SPX_N and SPX_SIG_BYTES
ifneq (,$(filter %128f,$(PARAMETER_SET)))
  SPX_N = 16
  SPX_SIG_BYTES = 17088
endif
ifneq (,$(filter %128s,$(PARAMETER_SET)))
  SPX_N = 16
  SPX_SIG_BYTES = 7856
endif
ifneq (,$(filter %192f,$(PARAMETER_SET)))
  SPX_N = 24
  SPX_SIG_BYTES = 35664
endif
ifneq (,$(filter %192s,$(PARAMETER_SET)))
  SPX_N = 24
  SPX_SIG_BYTES = 16224
endif
ifneq (,$(filter %256f,$(PARAMETER_SET)))
  SPX_N = 32
  SPX_SIG_BYTES = 49856
endif
ifneq (,$(filter %256s,$(PARAMETER_SET)))
  SPX_N = 32
  SPX_SIG_BYTES = 29792
endif

# select the correct hash function implementation file,
# relative to the implementation folder
ifneq (,$(filter sha2-128s sha2-128f,$(PARAMETER_SET)))
  HASH_IMPL = hash/hash_sha256.jinc
endif
ifneq (,$(filter sha2-192s sha2-192f sha2-256s sha2-256f,$(PARAMETER_SET)))
  HASH_IMPL = hash/hash_sha512.jinc
endif
ifneq (,$(filter shake-128s shake-128f shake-192s shake-192f shake-256s shake-256f,$(PARAMETER_SET)))
  HASH_IMPL = hash/hash_shake256.jinc
endif

# make the Jasmin parameter header, with the SPHINCS+ parameters and the hash function implementations
$(ARCHITECTURE)/ref/active_params.jinc:
	@echo 'require "../../params/params-spx-$(PARAMETER_SET).jinc" // SPHINCS+ parameters' > $(ARCHITECTURE)/ref/active_params.jinc
	@echo 'require "$(HASH_IMPL)" // hash function implementations' >> $(ARCHITECTURE)/ref/active_params.jinc

# make the Jasmin parameter header, with the SPHINCS+ parameters and the hash function implementations
$(ARCHITECTURE)/avx2/active_params.jinc:
	@echo 'require "../../params/params-spx-$(PARAMETER_SET).jinc" // SPHINCS+ parameters' > $(ARCHITECTURE)/avx2/active_params.jinc
	@echo 'require "$(HASH_IMPL)" // hash function implementations' >> $(ARCHITECTURE)/avx2/active_params.jinc

# make the C parameter header
$(PARAM_HEADER):
	@echo "#pragma once" > $(PARAM_HEADER)
	@echo "#define SPX_N $(SPX_N)" >> $(PARAM_HEADER)
	@echo "#define SPX_SIG_BYTES $(SPX_SIG_BYTES)" >> $(PARAM_HEADER)

# ---------------------------------------------------------------- #
#  COMPILING                                                       #
# ---------------------------------------------------------------- #

# build the Jasmin compiler
$(JASMINC):
	@printf "\033[36mBuilding Jasmin compiler\033[0m\n"
	@cd jasmin/compiler && \
	make -s > jasmin_build.log 2>&1 && \
	printf "\033[36mJasmin compiler built\033[0m\n"

# compile assembly file
slh_dsa_$(PARAMETER_SET)_ref_$(ARCHITECTURE).s: \
	$(JASMINC) \
	$(ARCHITECTURE)/ref/spx.jazz \
	$(ARCHITECTURE)/ref/active_params.jinc \
	$(PARAM_HEADER)

	@$(JASMINC) $(JASMINFLAGS) -o slh_dsa_$(PARAMETER_SET)_ref_$(ARCHITECTURE).s $(ARCHITECTURE)/ref/spx.jazz
	@grep -q GNU-stack slh_dsa_$(PARAMETER_SET)_ref_$(ARCHITECTURE).s || echo '.section .note.GNU-stack,"",@progbits' >> slh_dsa_$(PARAMETER_SET)_ref_$(ARCHITECTURE).s

# compile assembly file
slh_dsa_$(PARAMETER_SET)_avx2_$(ARCHITECTURE).s: \
	$(JASMINC) \
	$(ARCHITECTURE)/avx2/spx.jazz \
	$(ARCHITECTURE)/avx2/active_params.jinc \
	$(PARAM_HEADER)

	@$(JASMINC) $(JASMINFLAGS) -o slh_dsa_$(PARAMETER_SET)_avx2_$(ARCHITECTURE).s $(ARCHITECTURE)/avx2/spx.jazz
	@grep -q GNU-stack slh_dsa_$(PARAMETER_SET)_avx2_$(ARCHITECTURE).s || echo '.section .note.GNU-stack,"",@progbits' >> slh_dsa_$(PARAMETER_SET)_avx2_$(ARCHITECTURE).s

# compile object file
slh_dsa_$(PARAMETER_SET)_ref_$(ARCHITECTURE).o: slh_dsa_$(PARAMETER_SET)_ref_$(ARCHITECTURE).s
	@$(CC) -c $< -o $@ -no-pie

# compile object file
slh_dsa_$(PARAMETER_SET)_avx2_$(ARCHITECTURE).o: slh_dsa_$(PARAMETER_SET)_avx2_$(ARCHITECTURE).s
	@$(CC) -c $< -o $@ -no-pie

# ---------------------------------------------------------------- #
#  COMMAND-LINE INTERFACE                                          #
# ---------------------------------------------------------------- #

# compile assembly and C into a CLI executable
$(CLI): \
	slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE).o \
	slh_dsa_cli.c \
	$(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)/misc/jasmin_syscall.o

	@$(CC) slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE).o slh_dsa_cli.c $(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)/misc/jasmin_syscall.o -o $(CLI) -no-pie
	@printf "\033[33mCommand-Line Interface compiled, see ./cli --help for usage instructions\033[0m\n"

# ---------------------------------------------------------------- #
#  KAT TESTING                                                     #
# ---------------------------------------------------------------- #

# group the test vectors in .json files per parameter set
$(GROUPED_JSONS): tests/acvp/group_json_per_paramset.py
	@python3 tests/acvp/group_json_per_paramset.py

# compile SPHINCS+ API from Jasmin to assembly
slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)_kattest.s: \
	$(JASMINC) \
	$(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)/spx/spx.jinc \
	$(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)/active_params.jinc \
	$(PARAM_HEADER)

	@$(JASMINC) $(JASMINFLAGS) -o slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)_kattest.s $(ARCHITECTURE)/$(IMPLEMENTATION_TYPE)/spx/spx.jinc
	@grep -q GNU-stack slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)_kattest.s || echo '.section .note.GNU-stack,"",@progbits' >> slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)_kattest.s

# generate a shared library
slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE).so: slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE)_kattest.s
	@$(CC) $^ -fPIC -shared -o $@

# generate the testing wrapper using the shared library
TESTING_WRAPPER :=
ifeq ($(ARCHITECTURE), x86-64)
	TESTING_WRAPPER = slh_dsa_$(PARAMETER_SET)_$(IMPLEMENTATION_TYPE)_$(ARCHITECTURE).so
endif

# run one implementation (given a specific parameter set) against the KATs
.PHONY: acvp-kat-test
acvp-kat-test: $(TESTING_WRAPPER) $(GROUPED_JSONS)
	@python3 -m pytest --parameter-set=$(PARAMETER_SET) --architecture=$(ARCHITECTURE) --implementation-type=$(IMPLEMENTATION_TYPE) tests/test_acvp_kats.py
	@$(MAKE) clean

# run all implementations (for all NIST-approved parameter sets) against the KATs
.PHONY: acvp-kat-test-all
acvp-kat-test-all:
	@$(MAKE) clean
	@for i in $(IMPLEMENTATIONS); do \
		for p in $(PARAMETER_SETS); do \
			printf "\033[33mTesting %s (%s implementation)\033[0m\n" "$$p" "$$i"; \
			$(MAKE) acvp-kat-test \
				IMPLEMENTATION_TYPE=$$i \
				PARAMETER_SET=$$p \
				|| exit 1; \
		done; \
	done

# ---------------------------------------------------------------- #
#  OPENSSL COMPILING                                               #
# ---------------------------------------------------------------- #

OPENSSL_BUILD := $(CURDIR)/bench/impls/openssl
OPENSSL_SRC   := $(CURDIR)/openssl

CFLAGS += -I$(OPENSSL_BUILD)/include

LDFLAGS += \
    -L$(OPENSSL_BUILD)/lib64 \
    -Wl,-rpath,$(OPENSSL_BUILD)/lib64

LDLIBS += -lcrypto

$(OPENSSL_BUILD)/lib64/libcrypto.so:
	@printf "\033[36mInstalling OpenSSL (this may take a while)\033[0m\n"
	@cd $(OPENSSL_SRC) && \
	./Configure linux-x86_64 \
	    --prefix=$(OPENSSL_BUILD) \
	    -O3 -march=native no-tests > /tmp/openssl_config.log 2>&1 && \
	make -j2 -s > /tmp/openssl_build.log 2>&1 && \
	make install_sw -s > /tmp/openssl_install.log && \
	printf "\033[36mOpenSSL installed\033[0m\n"

# ---------------------------------------------------------------- #
#  BENCHMARKING                                                    #
# ---------------------------------------------------------------- #

# Jasmin implementations: create a static archive
bench/impls/impl_jasmin_$(ARCHITECTURE)_%_$(PARAMETER_SET).a: \
	slh_dsa_$(PARAMETER_SET)_%_$(ARCHITECTURE).o \
	$(ARCHITECTURE)/%/misc/jasmin_syscall.o

	@mkdir -p bench/impls
	@ar rcs $@ $^

# C reference impl: define directory
SPHINCSPLUS_REF_DIR = sphincsplus/ref

# C reference impl: define source files
SPHINCSPLUS_SOURCES = \
	$(SPHINCSPLUS_REF_DIR)/address.c \
	$(SPHINCSPLUS_REF_DIR)/randombytes.c \
	$(SPHINCSPLUS_REF_DIR)/merkle.c \
	$(SPHINCSPLUS_REF_DIR)/wots.c \
	$(SPHINCSPLUS_REF_DIR)/wotsx1.c \
	$(SPHINCSPLUS_REF_DIR)/utils.c \
	$(SPHINCSPLUS_REF_DIR)/utilsx1.c \
	$(SPHINCSPLUS_REF_DIR)/fors.c \
	$(SPHINCSPLUS_REF_DIR)/sign.c

# C reference impl: add SHAKE sources
ifneq (,$(findstring shake,$(PARAMETER_SET)))
SPHINCSPLUS_SOURCES += \
	$(SPHINCSPLUS_REF_DIR)/fips202.c \
	$(SPHINCSPLUS_REF_DIR)/hash_shake.c \
	$(SPHINCSPLUS_REF_DIR)/thash_shake_simple.c
endif

# C reference impl: add SHA2 sources
ifneq (,$(findstring sha2,$(PARAMETER_SET)))
SPHINCSPLUS_SOURCES += \
	$(SPHINCSPLUS_REF_DIR)/sha2.c \
	$(SPHINCSPLUS_REF_DIR)/hash_sha2.c \
	$(SPHINCSPLUS_REF_DIR)/thash_sha2_simple.c
endif

# C reference impl: define object files
SPHINCSPLUS_OBJS = $(SPHINCSPLUS_SOURCES:.c=.o)

# C reference impl: define C compiler flags
CFLAGS += -Wall -Wextra -Wpedantic -O3 -std=c99 -Wmissing-prototypes

# C reference impl: compile object files
$(SPHINCSPLUS_REF_DIR)/%.o: $(SPHINCSPLUS_REF_DIR)/%.c
	@$(CC) $(CFLAGS) -DPARAMS=sphincs-$(PARAMETER_SET) -c $< -o $@

# C reference impl: create a static archive
bench/impls/impl_c_ref_$(PARAMETER_SET).a: $(SPHINCSPLUS_OBJS)
	@mkdir -p bench/impls
	@ar rcs $@ $^

# compile a benchmarking executable
$(BENCH): \
	bench/bench_slh_dsa.c \
	bench/impl_ifaces/iface_jasmin_ref.c \
	bench/impl_ifaces/iface_jasmin_avx2.c \
	bench/impl_ifaces/iface_c_ref.c \
	bench/impl_ifaces/iface_openssl.c \
	bench/impls/impl_jasmin_$(ARCHITECTURE)_ref_$(PARAMETER_SET).a \
	bench/impls/impl_jasmin_$(ARCHITECTURE)_avx2_$(PARAMETER_SET).a \
	bench/impls/impl_c_ref_$(PARAMETER_SET).a \
	$(OPENSSL_BUILD)/lib64/libcrypto.so

	@printf "\033[33mRunning benchmarking of %s\033[0m\n" "$(PARAMETER_SET)";
	@$(CC) \
		bench/bench_slh_dsa.c \
    	bench/impl_ifaces/iface_jasmin_ref.c \
    	bench/impl_ifaces/iface_jasmin_avx2.c \
    	bench/impl_ifaces/iface_c_ref.c \
    	bench/impl_ifaces/iface_openssl.c \
		bench/impls/impl_jasmin_$(ARCHITECTURE)_ref_$(PARAMETER_SET).a \
		bench/impls/impl_jasmin_$(ARCHITECTURE)_avx2_$(PARAMETER_SET).a \
		bench/impls/impl_c_ref_$(PARAMETER_SET).a \
		-o $(BENCH) \
		-no-pie \
		$(LDFLAGS) $(LDLIBS) \
		-DOPENSSL_PARAMSET=\"SLH-DSA-$(subst sha2,SHA2,$(subst shake,SHAKE,$(PARAMETER_SET)))\"
	@rm -rf sphincsplus/ref/*.o

# execute the benchmarking
.PHONY: bench
bench: $(BENCH)
	@./$(BENCH) $(PARAMETER_SET)

# run benchmarking for all NIST-approved parameter sets
.PHONY: bench-all
bench-all:
	@for p in $(PARAMETER_SETS); do \
		$(MAKE) bench PARAMETER_SET=$$p || exit 1; \
		rm -rf \
			$(ARCHITECTURE)/ref/active_params.jinc \
			$(ARCHITECTURE)/avx2/active_params.jinc \
			$(PARAM_HEADER) \
			sphincsplus/ref/*.o \
			bench/slh_dsa_bench; \
	done