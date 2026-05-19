import json
from pathlib import Path


RAW_DIR = Path(__file__).parent / "raw"
GROUPED_DIR = Path(__file__).parent / "grouped"

PARAMETER_SETS = {
    "SLH-DSA-SHA2-128s": "slh_dsa_sha2-128s.json",
    "SLH-DSA-SHA2-128f": "slh_dsa_sha2-128f.json",
    "SLH-DSA-SHA2-192s": "slh_dsa_sha2-192s.json",
    "SLH-DSA-SHA2-192f": "slh_dsa_sha2-192f.json",
    "SLH-DSA-SHA2-256s": "slh_dsa_sha2-256s.json",
    "SLH-DSA-SHA2-256f": "slh_dsa_sha2-256f.json",
    "SLH-DSA-SHAKE-128s": "slh_dsa_shake-128s.json",
    "SLH-DSA-SHAKE-128f": "slh_dsa_shake-128f.json",
    "SLH-DSA-SHAKE-192s": "slh_dsa_shake-192s.json",
    "SLH-DSA-SHAKE-192f": "slh_dsa_shake-192f.json",
    "SLH-DSA-SHAKE-256s": "slh_dsa_shake-256s.json",
    "SLH-DSA-SHAKE-256f": "slh_dsa_shake-256f.json",
}


def load_json(filename):
    with open(RAW_DIR / filename, "r") as f:
        return json.load(f)


def build_expected_results_lookup(expected_results_json):
    """
    Build lookup table:
        (tgId, tcId) -> expected_results_test
    """
    lookup = {}

    for group in expected_results_json["testGroups"]:
        tg_id = group["tgId"]

        for test in group["tests"]:
            tc_id = test["tcId"]
            lookup[(tg_id, tc_id)] = test

    return lookup


def normalize_parameter_set(parameter_set):
    """
    Convert:
        SLH-DSA-SHA2-128s
    into:
        sha2-128s
    """
    return parameter_set.replace("SLH-DSA-", "").lower()


def process_keygen(prompt_json, expected_json, grouped_kats):
    expected_lookup = build_expected_results_lookup(expected_json)

    for group in prompt_json["testGroups"]:
        tg_id = group["tgId"]
        
        parameter_set = group["parameterSet"]
        if parameter_set not in grouped_kats:
            continue

        for test in group["tests"]:
            tc_id = test["tcId"]

            expected = expected_lookup[(tg_id, tc_id)]

            kat = {
                "mode": "keyGen",
                "tcId": tc_id,
                "skSeed": test["skSeed"],
                "skPrf": test["skPrf"],
                "pkSeed": test["pkSeed"],
                "sk": expected["sk"],
                "pk": expected["pk"],
            }

            grouped_kats[parameter_set].append(kat)


def process_siggen(prompt_json, expected_json, grouped_kats):
    expected_lookup = build_expected_results_lookup(expected_json)

    for group in prompt_json["testGroups"]:
        # Only include:
        #   preHash == "pure"
        #   signatureInterface == "external"
        if group.get("preHash") != "pure":
            continue

        if group.get("signatureInterface") != "external":
            continue

        tg_id = group["tgId"]

        parameter_set = group["parameterSet"]
        if parameter_set not in grouped_kats:
            continue

        deterministic = group["deterministic"]

        for test in group["tests"]:
            tc_id = test["tcId"]

            expected = expected_lookup[(tg_id, tc_id)]

            kat = {
                "mode": "sigGen",
                "tcId": tc_id,
                "deterministic": deterministic,
                "sk": test["sk"],
                "message": test["message"],
                "context": test["context"],
                "signature": expected["signature"],
            }

            if not deterministic:
                kat["additionalRandomness"] = test["additionalRandomness"]

            grouped_kats[parameter_set].append(kat)


def process_sigver(prompt_json, expected_json, grouped_kats):
    expected_lookup = build_expected_results_lookup(expected_json)

    for group in prompt_json["testGroups"]:
        # Only include:
        #   preHash == "pure"
        #   signatureInterface == "external"
        if group.get("preHash") != "pure":
            continue

        if group.get("signatureInterface") != "external":
            continue

        tg_id = group["tgId"]

        parameter_set = group["parameterSet"]
        if parameter_set not in grouped_kats:
            continue

        for test in group["tests"]:
            tc_id = test["tcId"]

            expected = expected_lookup[(tg_id, tc_id)]

            kat = {
                "mode": "sigVer",
                "tcId": tc_id,
                "pk": test["pk"],
                "message": test["message"],
                "context": test["context"],
                "signature": test["signature"],
                "testPassed": expected["testPassed"],
            }

            grouped_kats[parameter_set].append(kat)


def main():
    GROUPED_DIR.mkdir(parents=True, exist_ok=True)

    grouped_kats = {
        parameter_set: []
        for parameter_set in PARAMETER_SETS
    }

    # Load raw ACVP files
    keygen_prompt = load_json("keyGen_prompt.json")
    keygen_expected = load_json("keyGen_expectedResults.json")

    siggen_prompt = load_json("sigGen_prompt.json")
    siggen_expected = load_json("sigGen_expectedResults.json")

    sigver_prompt = load_json("sigVer_prompt.json")
    sigver_expected = load_json("sigVer_expectedResults.json")

    # Process KATs
    process_keygen(
        keygen_prompt,
        keygen_expected,
        grouped_kats
    )

    process_siggen(
        siggen_prompt,
        siggen_expected,
        grouped_kats
    )

    process_sigver(
        sigver_prompt,
        sigver_expected,
        grouped_kats
    )

    # Write grouped output files
    for parameter_set, output_filename in PARAMETER_SETS.items():
        output_path = GROUPED_DIR / output_filename

        with open(output_path, "w") as f:
            json.dump(grouped_kats[parameter_set], f, indent=2)

        # print(
        #     f"Wrote {len(grouped_kats[parameter_set])} KATs to "
        #     f"{output_path}"
        # )


if __name__ == "__main__":
    main()