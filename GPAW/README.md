# GPAW

## Provisional Intel (intelpython & MPI)

1. make a test directory in $GPAW/tests
2. copy over install_libxc_intel.sh and modify the paths in the script
3. Run install for libxc.
4. Clone GPAW from gitlab git clone -b 21.1.0 https://gitlab.com/gpaw/gpaw.git
5. copy siteconfig.py and fix paths to point to new compiled libxc
6. Activate a conda environment (intelpython3 has conda built in)
7. load modules <code>ml intel intelpython3</code>
8. run <code>python -m pip install .</code> in the gpaw folder

### Provisional Results

to be added
