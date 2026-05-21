# SPHINCS+ Jasmin Implementation

## Parameter Sets

Compiling any specific implementation is done by setting the ```PARAMSET``` option with ```make```. This Jasmin implementation provides support for all NIST-approved (FIPS 205) parameter sets. That is to say, ```PARAMSET``` may have any of the following values.

* SHA2: ```sha2-128s``` | ```sha2-128f``` | ```sha2-192s``` | ```sha2-192f``` | ```sha2-256s``` | ```sha2-256f```

* SHAKE256: ```shake-128s``` | ```shake-128f``` | ```shake-192s``` | ```shake-192f``` | ```shake-256s``` | ```shake-256f``` (default)

For example, one can run ```make PARAMSET=sha2-192s```. This produces the assembly file ```slh_dsa_sha2-192s_ref_x86-64.s```.

## Known-Answer Tests (KATs)

Some scripts are included to run the implementation against a set of NIST-provided ACVP server KATs.

Running all KAT tests for all parameter sets can be done with ```make acvp-kat-test-all```.

Running the KAT tests only for a specific parameter set instead is done with e.g. ```make acvp-kat-test PARAMSET=sha2-128f```.

## Command-Line Interface (CLI) ./slh_dsa_cli

This implementation comes with a simple CLI to manually sign and verify files. Compile the CLI with a given parameter set, e.g. ```make slh_dsa_cli PARAMSET=sha2-128f```. This produces a runnable file ```slh_dsa_cli```.

The CLI has a help option (-h or --help both work) that explains how to use the CLI. Running ```./slh_dsa_cli --help``` prints the following information:

Modes: keygen, sign, and verify

* _keygen_ generates a pair of secret- and public keys.
  The secret- and public keys are written to outputs/sk.bin and outputs/pk.bin respectively.
  * Parameters:  
    (none)
  * Example usage:  
    ```./slh_dsa_cli -mode keygen```

* _sign_ signs a message.
  Uses the secret- and public keys in outputs/sk.bin and outputs/pk.bin.
  Signature is written to outputs/sig.bin.
  * Parameters:  
    -msg <filepath> = the file path to the file to sign (required)  
    -ctx "<string>" = the context string (default: "")  
    -det <bool> = whether to use deterministic additional randomness (default: false)
  * Example usage:  
    ```./slh_dsa_cli -mode sign -ctx "context" -msg README.md```  
    ```./slh_dsa_cli -mode sign -msg slh_dsa_cli.c -det true```

* _verify_ verifies a message.
  Uses the public key in outputs/pk.bin and signature in outputs/sig.bin.
  * Parameters:  
    -msg <filepath> = the file path to the file to sign (required)  
    -ctx "<string>" = the context string (default: "")
  * Example usage:  
    ```./slh_dsa_cli -mode verify -ctx "context" -msg README.md```  
    ```./slh_dsa_cli -mode verify -msg slh_dsa_cli.c```




















