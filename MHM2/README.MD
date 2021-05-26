# MHM2

## RCHPC

Install GCC from install scripts
Install upcxx
Install MHM
Easy

## Niagara
Niagara provides up to date intel and gcc compiler suites which can be used.
Currently the install scripts work with gcc for building both upcxx and MHM2.
Using the intel compiler throws an error "icpc -Wno-catch-value not supported" when compiling mhm
Slurm script largely copied from HPCAC page
MHM must be compiled with UPCXX_NETWORK=ibv exported for multi node runs

### Results
Across 4 nodes:
Arctic sample in 40s
Competition input in 617.02s