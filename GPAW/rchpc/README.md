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


