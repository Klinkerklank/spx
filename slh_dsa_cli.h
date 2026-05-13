#ifndef SLH_DSA_CLI_H
#define SLH_DSA_CLI_H

#include <stdint.h>
#include <stddef.h>

int slh_keygen(
  uint8_t sk[4*SPX_N],
  uint8_t pk[2*SPX_N]
);

int slh_sign(
  uint8_t sig[SPX_SIG_BYTES],
  const uint64_t ctx_msg_ptrs[2],
  const uint64_t ctx_msg_lens[2],
  const uint8_t sk[4*SPX_N],
  const uint8_t deterministic
);

int slh_verify(
  const uint64_t ctx_msg_ptrs[2],
  const uint64_t ctx_msg_lens[2],
  const uint8_t sig[SPX_SIG_BYTES],
  const uint8_t pk[2*SPX_N]
);

#endif /* SLH_DSA_CLI_H */

