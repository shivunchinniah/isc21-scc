#!/bin/bash

LAMMPS=$SCRATCH/LAMMPS
ROOT_DIR=$LAMMPS/Instances/test1
DOWNLOADS=$LAMMPS/downloads

wget -P $DOWNLOADS "https://www.mellanox.com/downloads/hpc/hpc-x/v2.7/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64.tbz"
tar xf $DOWNLOADS/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64.tbz 
module use $SCRATCH/LAMMPS/Instances/test1/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64/modulefiles/
