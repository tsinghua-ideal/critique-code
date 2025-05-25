# Independent/Dependent Gaussian/Key Polynomial

## Test file

For all these cpp files, you should put them into the `src/pke/examples` folder of OpenFHE to build it. We are using OpenFHE v1.3

Note that other folder may have a patch for norm, make sure you do not have that patch applied for these tests.

`gaussian.cpp` is for both gaussian polynomial and key polynomial. Its usage is

```bash
./exectuable <depth> <ringDim> <mulDepth> <numTests> <isKey>
```

To run similar tests as the paper, you could use

```bash
# gaussian
./exectuable 32 65536 15 1 0
# key
./exectuable 32 65536 15 1 1
```

Each test tests both the independent case and dependent case, i.e. the former is 32 independent polynomial multiplied together, while the latter is one polynomial multiplied 32 times.

## Plot and Analyse

See `plot.py`, which uses `data/` and generates image in `figure/`.
