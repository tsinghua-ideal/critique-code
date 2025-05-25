# Critique for HPS19/KPZ21 average-case expansion factor

## Some cases

For all these cpp files, you should put them into the `src/pke/examples` folder of OpenFHE to build it. We are using OpenFHE v1.3

Note that other folder may have a patch for norm, make sure you do not have that patch applied for these tests.

`bgv-modreduce.cpp` extracts the noise after mod reducing and compare with the bound using average-case expansion factor. You may need to run it a few times to see noise exceeding the bound.

`bfv-enc-extended.cpp` extracts the noise after fresh encryption with EXTENDED encryption technique. EXTENDED encryption is a standard encryption + modulus switching, so it is essentially the same case as above. This time the bound is almost always exceeded.

## Dependent Secret Key

See the `gaussian_key` folder.
