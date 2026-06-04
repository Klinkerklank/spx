#ifndef SLH_DSA_API_AVX2
#define SLH_DSA_API_AVX2

#include <stdint.h>
#include <stddef.h>

extern int slh_keygen_avx2(
  uint8_t sk[4*SPX_N],
  uint8_t pk[2*SPX_N]
);

extern int slh_keygen_internal_avx2(
  uint8_t sk[4*SPX_N],
  uint8_t pk[2*SPX_N],
  const uint8_t keyrnd[3*SPX_N]
);

extern int slh_sign_avx2(
  uint8_t sig[SPX_SIG_BYTES],
  const uint64_t ctx_msg_ptrs[2],
  const uint64_t ctx_msg_lens[2],
  const uint8_t sk[4*SPX_N],
  const uint8_t deterministic
);

extern int slh_sign_internal_avx2(
  uint8_t sig[SPX_SIG_BYTES],
  const uint64_t ctx_msg_ptrs[2],
  const uint64_t ctx_msg_lens[2],
  const uint8_t sk[4*SPX_N],
  const uint8_t addrnd[SPX_N]
);

extern int slh_verify_avx2(
  const uint64_t ctx_msg_ptrs[2],
  const uint64_t ctx_msg_lens[2],
  const uint8_t sig[SPX_SIG_BYTES],
  const uint8_t pk[2*SPX_N]
);

extern int slh_verify_internal_avx2(
  const uint64_t ctx_msg_ptrs[2],
  const uint64_t ctx_msg_lens[2],
  const uint8_t sig[SPX_SIG_BYTES],
  const uint8_t pk[2*SPX_N]
);

#endif /* SLH_DSA_API_AVX2 */

