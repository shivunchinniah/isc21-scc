# HPCG

# Provisional OpenMPI + GCC 4.8.5

1. Run <code>./install_hpcg_v3.1.sh</code> (this will download, compile and install)

## Results:
For these first set of provisional results 2x Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz were used. (v100 rchpc)
28 cores with 128GB RAM each.

hpcg.dat:\
<code>
HPCG benchmark input file\
Sandia National Laboratories; University of Tennessee, Knoxville\
16 16 16\
1800
</code>

GFLOP/s value of: `51.7859`

# Niagara Intel MPI + ICC 2019.4.243

## Results:
For these set of results 4x Intel(R) Xeon(R) Gold 5115 CPU @ 2.40GHz were used.
40 logical cores with 96GB RAM each.

### Default
hpcg.dat:\
<code>
HPCG benchmark input file\
Sandia National Laboratories; University of Tennessee, Knoxville\
104 104 104\
1800
</code>

GFLOP/s value of: `97.4203`

### Optimised
hpcg.dat:\
<code>
HPCG benchmark input file\
Sandia National Laboratories; University of Tennessee, Knoxville\
16 16 16
1800
</code>

GFLOP/s value of: `175.012`

# Aspire Intel MPI + ICC 2019.4.243

## Results:
For these set of results 4x Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz were used.
24 logical cores with 96GB RAM each.

### Optimised
hpcg.dat:\
<code>
HPCG benchmark input file\
Sandia National Laboratories; University of Tennessee, Knoxville\
16 16 16\
1800
</code>

GFLOP/s value of: `89.5424`


# Provisional NVIDIA Precompiled

To do.

## Resources
https://ulhpc-tutorials.readthedocs.io/en/latest/parallel/hybrid/HPCG/
https://github.com/hpcg-benchmark/hpcg/blob/master/INSTALL

## Download
http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
