import json

def parse_rsp(file):
    kats = []
    current = {}

    with open(file) as f:
        for line in f:
            line = line.strip()

            if not line:
                if current:
                    kats.append(current)
                    current = {}
                continue

            if "=" not in line:
                continue

            k, v = [x.strip() for x in line.split("=", 1)]
            current[k] = v

    if current:
        kats.append(current)

    return kats


def convert_rsp_to_json(rsp_file, json_file):
    kats = parse_rsp(rsp_file)

    out = []
    for i, kat in enumerate(kats):
        entry = {
            "count": i,
            "key_generation_seed": kat.get("seed", ""),
            "message": kat.get("msg", ""),
        }

        # Extract signature from sm = sig || msg
        sm = kat.get("sm", "")
        msg = kat.get("msg", "")

        sig_len = len(sm) - len(msg)
        signature = sm[:sig_len]

        import hashlib

        entry["sha3_256_hash_of_verification_key"] = hashlib.sha3_256(
            bytes.fromhex(kat["pk"])
        ).hexdigest()

        entry["sha3_256_hash_of_signing_key"] = hashlib.sha3_256(
            bytes.fromhex(kat["sk"])
        ).hexdigest()

        entry["sha3_256_hash_of_signature"] = hashlib.sha3_256(
            bytes.fromhex(signature)
        ).hexdigest()

        out.append(entry)

    with open(json_file, "w") as f:
        json.dump(out, f, indent=2)


# Example usage
for choice in ["sha2-128s", "sha2-128f", "sha2-192s", "sha2-192f", "sha2-256s", "sha2-256f"]:
    convert_rsp_to_json(
        "rsp/slh_dsa_{}.rsp".format(choice),
        "json/slh_dsa_{}.json".format(choice)
    )