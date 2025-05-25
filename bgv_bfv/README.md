# Tests for Independent/Same BGV/BFV ciphertext

## Run the tests

This fold has all the tests generated for you, and once you set `$OPENFHE_PATH` and run `copy.sh`, you should be able to build and run the test. You should also apply `norm.patch` to OpenFHE as `double` wont represent noise bigger than `2^1024`.

## Generating the tests

This folder uses [HEIR compiler](https://github.com/google/heir) to generate tests. If you find the test generating script not working, you could pin to `0cf06307c31c33d0f7fc32488e2f5f25296aebfb` of HEIR. The test generating script and auxiliary files are supposed to be put inside the HEIR structure, or you could directly use HEIR binary and small modification to the test generating script.

## Plot and Analyse

See `plot.py`, which uses `data/` and generates image in `figure/`.
