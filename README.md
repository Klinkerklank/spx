# SPHINCS+ Jasmin Implementation

## Dependencies

This repository tries to have as few dependencies as possible, as to make using it more reliable and (hopefully) errorless. To this end, the following installation instructions are required for a blank Linux (Ubuntu 26.04.1 LTS) machine:

1. install standard packages:
   * ```sudo apt-get install git``` (for cloning the repository)
   * ```sudo apt-get install opam``` (package manager for installing Jasmin dependencies)
3. clone the repository:
   * all in one: ```git clone --recurse-submodules https://Klinkerklank/spx```
   * or separately: ```git clone https://Klinkerklank/spx; git submodule init; git submodule update```
4. from the ```spx/jasmin``` folder, install the Jasmin dependencies:
   * ```eval $(opam env --switch=default)```
   * ```opam install ./jasmin.opam --deps-only```
   * ```eval $(opam env)```
5. only if you want to run the known-answer tests:
   * ```sudo apt-get install python3-pytest```
5. only if you want to visualise any benchmarking results:
   * ```sudo apt-get install jupyter-core```
   * ```sudo apt-get install python3-ipykernel```
   * ```sudo apt-get install python3-notebook```

The first time any of the available ```make``` commands listed below is executed, the Jasmin compiler file (```spx/jasmin/compiler/jasminc```)  will automatically be created. This may take a while.

## Command-Line Options

Compiling any specific implementation is done by setting three optional command-line options. Firstly, there is the ```PARAMETER_SET``` option. The Jasmin implementation provides support for all NIST-approved (FIPS 205) parameter sets. That is to say, ```PARAMETER_SET``` may have any of the following values.

* SHA2: ```sha2-128s``` | ```sha2-128f``` | ```sha2-192s``` | ```sha2-192f``` | ```sha2-256s``` | ```sha2-256f```

* SHAKE256: ```shake-128s``` | ```shake-128f``` | ```shake-192s``` | ```shake-192f``` | ```shake-256s``` | ```shake-256f``` (<- default)

For example, one can run ```make PARAMETER_SET=sha2-192s```. This produces the assembly file ```slh_dsa_sha2-192s_ref_x86-64.s```.

Secondly, choosing the type of implementation happens by setting ```IMPLEMENTATION_TYPE```. The supported types are these:

* reference implementation: ```ref```

* optimised implementation: ```avx2``` (<- default)

Thirdly, the architecture can be chosen by setting ```ARCHITECTURE```. The supported architectures are these:

* AMD: ```x86-64``` (<- default)

## Known-Answer Tests (KATs)

Some Python scripts are included to run the implementation against a set of NIST-provided ACVP server KATs.

Running all KAT tests for all parameter sets can be done with ```make acvp-kat-test-all```. Running the KAT tests only for a specific parameter set instead is done with e.g. ```make acvp-kat-test PARAMETER_SET=sha2-128f```.

## Benchmarking

Some C scripts are included to benchmark not only the Jasmin implementations, but also the OpenSSL and NIST C reference implementations as a frame of reference.

One can benchmark all of the implementations with ```make bench-all```. Running the benchmarking only for a specific parameter set instead is done with e.g. ```make bench PARAMETER_SET=sha2-128f```. The first time benchmarking is done, the OpenSSL crypto suite is installed as part of the implementations to compare against. This will take a while.

After ```make bench-all```, there is the option to plot the results in violin plots using the ```spx/bench/plot_bench_results.ipynb``` Python notebook. If you followed step 5 from the dependencies section, you can run ```jupyter execute bench/plot_bench_results.ipynb``` and find the figures in the ```bench/figures``` folder. Alternatively, open the notebook in a Jupyter browser window and 'run all' from there. The figures are plotted underneath their respective cells as well as being output to the aforementioned folder.

## Command-Line Interface (CLI)

This implementation comes with a simple CLI to manually sign and verify files. Compile the CLI with a given parameter set, e.g. ```make cli PARAMETER_SET=sha2-128f```. This produces a runnable file ```cli```. For simplicity of the code, the CLI always uses the reference implementation: the ```IMPLEMENTATION_TYPE``` option is ignored.

The CLI has a help option (-h or --help both work) that explains how to use the CLI. Running ```./cli --help``` prints the following information:

Modes: keygen, sign, and verify

* _keygen_ generates a pair of secret- and public keys.
  The secret- and public keys are written to outputs/sk.bin and outputs/pk.bin respectively.
  * Parameters:  
    (none)
  * Example usage:  
    ```./cli -mode keygen```

* _sign_ signs a message.
  Uses the secret- and public keys in outputs/sk.bin and outputs/pk.bin.
  Signature is written to outputs/sig.bin.
  * Parameters:  
    -msg <filepath> = the file path to the file to sign (required)  
    -ctx "<string>" = the context string (default: "")  
    -det <bool> = whether to use deterministic additional randomness (default: false)
  * Example usage:  
    ```./cli -mode sign -ctx "context" -msg README.md```  
    ```./cli -mode sign -msg slh_dsa_cli.c -det true```

* _verify_ verifies a message.
  Uses the public key in outputs/pk.bin and signature in outputs/sig.bin.
  * Parameters:  
    -msg <filepath> = the file path to the file to sign (required)  
    -ctx "<string>" = the context string (default: "")
  * Example usage:  
    ```./cli -mode verify -ctx "context" -msg README.md```  
    ```./cli -mode verify -msg slh_dsa_cli.c```




















