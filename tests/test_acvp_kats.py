import pytest

from pathlib import Path
import json

@pytest.fixture()
def kats(slh_dsa):
    kat_file = (
        Path(__file__).parent / "acvp" / "grouped" / "slh_dsa_{}.json".format(slh_dsa.parameter_set)
    )
    with open(kat_file, "r") as kats_raw:
        return json.load(kats_raw)


def test_against_cref_kats(slh_dsa, kats):
    for kat in kats:
        if kat["mode"] == "keyGen":
            # Key generation

            # Gather inputs
            skSeed = bytearray.fromhex(kat["skSeed"])
            skPrf  = bytearray.fromhex(kat["skPrf"])
            pkSeed = bytearray.fromhex(kat["pkSeed"])
            key_input = skSeed + skPrf + pkSeed

            # Call implementation
            (verification_key, signing_key) = slh_dsa.generate_keypair(key_input)

            # Assert outputs
            assert verification_key == bytes.fromhex(kat["pk"]), print("\nFailure (keygen) at tcId number {}".format(kat.get("tcId")))
            assert signing_key      == bytes.fromhex(kat["sk"]), print("\nFailure (keygen) at tcId number {}".format(kat.get("tcId")))

        elif kat["mode"] == "sigGen":
            # Signing

            # Gather inputs
            sk      = bytearray.fromhex(kat["sk"])
            context = bytearray.fromhex(kat["context"])
            message = bytearray.fromhex(kat["message"])

            if kat["deterministic"]:
                # set addrnd to pkseed for the deterministic variant
                SPX_N = len(sk) // 4
                additionalRandomness = sk[2*SPX_N : 3*SPX_N]
            else:
                additionalRandomness = bytearray.fromhex(kat["additionalRandomness"])

            # Call implementation
            signature, result = slh_dsa.sign(
                sk,
                context,
                message,
                additionalRandomness
            )

            # Assert outputs
            assert result == 0, print("\nFailure at tcId number {}".format(kat.get("tcId")))
            assert signature == bytes.fromhex(kat["signature"]), print("\nFailure (signing) at tcId number {}".format(kat.get("tcId")))

        elif kat["mode"] == "sigVer":
            # Verification

            # Gather inputs
            pk        = bytearray.fromhex(kat["pk"])
            context   = bytearray.fromhex(kat["context"])
            message   = bytearray.fromhex(kat["message"])
            signature = bytearray.fromhex(kat["signature"])

            if len(signature) != 7856:
                continue

            # Call implementation
            result = slh_dsa.verify(
                pk,
                context,
                message,
                signature
            )

            # Assert output
            expected = 0 if kat["testPassed"] else 255
            assert result == expected, print("\nFailure (verification) at tcId number {}".format(kat.get("tcId")))
        
        else:
            pytest.fail(f"Unknown mode '{kat['mode']}'")