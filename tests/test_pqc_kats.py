import pytest

from pathlib import Path
import json
import hashlib

from pyAES_DRBG.aes_drbg import AES_DRBG

# SPHINCS+ parameter (for sha2-128s: N = 16)
SPX_N = 16

@pytest.fixture()
def kats(slh_dsa):
    kat_file = (
        Path(__file__).parent / "pqc" / "json" / "slh_dsa_{}.json".format(slh_dsa.parameter_set)
    )
    with open(kat_file, "r") as kats_raw:
        return json.load(kats_raw)


def test_against_pqc_kats(slh_dsa, kats):
    for kat in kats:
        # Test key generation.
        seed = bytearray.fromhex(kat["seed"])

        # Instantiate DRBG with the 48-byte seed.
        drbg = AES_DRBG(256)
        drbg.instantiate(bytes(seed))

        # Generate randomness for keygen (3 * N bytes).
        drbg_key_randomness = bytearray(drbg.generate(3*SPX_N))
        (verification_key, signing_key) = slh_dsa.generate_keypair(drbg_key_randomness)

        assert verification_key == bytes.fromhex(kat["pk"])
        assert signing_key      == bytes.fromhex(kat["sk"])

        # Then signing.

        # context = bytearray.fromhex(kat["context"])
        context = bytearray()
        message = bytearray.fromhex(kat["msg"])

        # Generate randomness for signing (N bytes)
        drbg_signing_randomness = bytearray(drbg.generate(SPX_N))
        
        print("SK.seed: " + signing_key[0*SPX_N : 1*SPX_N].hex().upper())
        print("SK.prf:  " + signing_key[1*SPX_N : 2*SPX_N].hex().upper())
        print("PK.seed: " + signing_key[2*SPX_N : 3*SPX_N].hex().upper())
        print("PK.root: " + signing_key[3*SPX_N : 4*SPX_N].hex().upper())
        print("optrand: " + drbg_signing_randomness.hex().upper())
        print("msg: " + kat["msg"])

        signature, result = slh_dsa.sign(
            signing_key,
            context,
            message,
            drbg_signing_randomness
        )
        assert result == 0

        sigstring = signature.hex().upper()

        print()
        print("  spx R: " + sigstring[:32])
        print(".json R: " + kat["sig"][:32])

        # print("spx sig:")
        # print(sigstring)
        # print(); print(); print()
        # print(".json sig:")
        # print(kat["sig"])

        sha3_256_hash_of_sig = hashlib.sha3_256(signature).digest()
        assert sha3_256_hash_of_sig == bytes.fromhex(
            (kat["sha3_256_hash_of_sig"])
        ), print("Failure at KAT number {}".format(kat["count"]))

        # And lastly, verification.
        result = slh_dsa.verify(verification_key, context, message, signature)
        assert result == 0