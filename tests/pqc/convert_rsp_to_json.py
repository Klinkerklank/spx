import json
import hashlib

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
            "seed": kat.get("seed", ""),
            "msg": kat.get("msg", ""),
            "pk": kat.get("pk", ""),
            "sk": kat.get("sk", ""),
        }

        # Extract signature from sm = sig || msg
        sm = kat.get("sm", "")
        msg = kat.get("msg", "")

        sig_len = len(sm) - len(msg)
        sig = sm[:sig_len]

        entry["sig"] = sig

        entry["sha3_256_hash_of_sig"] = hashlib.sha3_256(bytes.fromhex(sig)).hexdigest()

        out.append(entry)

    with open(json_file, "w") as f:
        json.dump(out, f, indent=2)


# Example usage
for choice in ["sha2-128s", "sha2-128f", "sha2-192s", "sha2-192f", "sha2-256s", "sha2-256f"]:
    convert_rsp_to_json(
        "tests/pqc/rsp/slh_dsa_{}.rsp".format(choice),
        "tests/pqc/json/slh_dsa_{}.json".format(choice)
    )