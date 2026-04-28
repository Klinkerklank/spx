# SPHINCS+ Jasmin Implementation

## Makefile

To compile the SPHINCS+ implementation for a given parameter set:

```make PARAMSET=<option>```

where ```<option>``` = ```sha2-128s``` (default if PARAMSET is not set) | ```sha2-128f```

To be added:

SHA512 Jasmin implementation to allow for ```sha2-192s```, ```sha2-192f```, ```sha2-256s```, ```sha2-256f```

SHAKE Jasmin implementation to allow for ```shake-128s```, ```shake-128f```, ```shake-192s```, ```shake-192f```, ```shake-256s```, ```shake-256f```

## Command-Line Interface

Key generation writes the secret key and public key to outputs/sk.bin and outputs/pk.bin respectively

./spx_cli -mode keygen

Signing takes a file path (through the -msg option) and the secret key in outputs/sk.bin, and produces the signature in outputs/sig.bin

./spx_cli -mode sign -msg \<file path\>

Verification takes a file path (through the -msg option) and the public key in outputs/pk.bin, and verifies whether the signature in outputs/sig.bin checks out

./spx_cli -mode verify -msg \<file path\>
