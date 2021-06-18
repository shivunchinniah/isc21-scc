# GPAW

## Provisional Intel (intelpython & MPI)

1. make a test directory in $GPAW/tests
2. copy over install_libxc_intel.sh and modify the paths in the script
3. Run install for libxc.
4. Clone GPAW from gitlab git clone -b 21.1.0 https://gitlab.com/gpaw/gpaw.git
5. copy siteconfig.py and fix paths to point to new compiled libxc
6. Activate a conda environment (intelpython3 has conda built in)
7. load modules <code>ml intel intelpython3</code>
8. Modify first: libxcVars.sh then <code>source libxcVars.sh</code>
9. run <code>python -m pip install .</code> in the gpaw folder

### Provisional Results (Intel)

For these first set of provisional results 2x Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz were used. (v100 rchpc) 28 cores with 128GB RAM each.

The competition python scripts have not yet been released hence the MoS2 & Ru2Cl6 Benchmarks were performed as a baseline.
Benchmarks from 2020 National Competition were used and can be found @ https://github.com/OleHolmNielsen/GPAW-benchmark-2020

###  Ru2Cl6
This benchmark took 17 minutes to complete.
See GPAW/results/intel_provisional/Ru2Cl6-benchmark.txt

### MoS2
This benchmark took 2 hours and 7 minutes to complete.
See GPAW/results/intel_provisional/Ru2Cl6-benchmark.tx

## Niagara (intel, intelmpi and python 3.8.5)

### 1 Node (copper.py)

| METRIC        | VALUE         | 
| ------------- |:-------------:|
| NUmber of cores (procs)      | 80 |
| Parallelization over k-points      | 4 (procs)      |
| Domain decomposition | 2 x 2 x 5      |
| SCF Cycle            | 910.419 (incl) |
| Total                | 944.620        |
| Free energy          | -320.793       |

### 2 Nodes (copper.py)

| METRIC        | VALUE         | 
| ------------- |:-------------:|
| NUmber of cores (procs)      | 160 |
| Parallelization over k-points      | 4 (procs)      |
| Domain decomposition | 2 x 4 x 5      |
| SCF Cycle            | 535.038 (incl) |
| Total                | 553.167        |
| Free energy          | -320.793       |

### 4 Nodes (copper.py)

| METRIC        | VALUE         | 
| ------------- |:-------------:|
| NUmber of cores (procs)      | 320 |
| Parallelization over k-points      | 4 (procs)      |
| Domain decomposition | 4 x 4 x 5      |
| SCF Cycle            | 326.208 (incl) |
| Total                | 336.473        |
| Free energy          | -320.793       |

## NSCC Intel (intel, intelmpi and python 3.8.3)

### 1 Node (copper.py)

| METRIC        | VALUE         | 
| ------------- |:-------------:|
| NUmber of cores (procs)      | 24 |
| Parallelization over k-points      | 4 (procs)      |
| Domain decomposition | 1 x 2 x 3      |
| SCF Cycle            | 5052.524 (incl) |
| Total                | 5115.225        |

### 2 Nodes (copper.py)

| METRIC        | VALUE         | 
| ------------- |:-------------:|
| NUmber of cores (procs)      | 48 |
| Parallelization over k-points      | 4 (procs)      |
| Domain decomposition | 2 x 2 x 3      |
| SCF Cycle            | 3885.655 (incl) |
| Total                | 3920.741        |

### 4 Nodes (copper.py)

| METRIC        | VALUE         | 
| ------------- |:-------------:|
| NUmber of cores (procs)      | 320 |
| Parallelization over k-points      | 4 (procs)      |
| Domain decomposition | 2 x 3 x 4      |
| SCF Cycle            | 3627.255 (incl) |
| Total                | 3646.646        |
