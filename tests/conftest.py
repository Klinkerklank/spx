import pytest

import slh_dsa_wrapper


def pytest_addoption(parser):
    parser.addoption(
        "--parameter-set",
        action="store",
        default="sha2-128f",
        help="SLH_DSA parameter set example: sha2-128f",
        choices=("sha2-128s", "sha2-128f", "sha2-192s", "sha2-192f", "sha2-256s", "sha2-256f", "shake-128s", "shake-128f", "shake-192s", "shake-192f", "shake-256s", "shake-256f"),
    )
    parser.addoption(
        "--architecture",
        action="store",
        default="amd64",
        help="CPU architecture: x86-64",
        choices=("x86-64"),
    )
    parser.addoption(
        "--implementation-type",
        action="store",
        default="ref",
        help="Implementation type: ref",
        choices=("ref", "avx2"),
    )


@pytest.fixture(scope="session")
def slh_dsa(request):
    architecture = request.config.getoption("--architecture")

    if architecture == "x86-64":
        return slh_dsa_wrapper.SLH_DSA_X86_64(
            request.config.getoption("--parameter-set"),
            request.config.getoption("--implementation-type"),
        )


@pytest.fixture(scope="session")
def architecture(request):
    return request.config.getoption("--architecture")