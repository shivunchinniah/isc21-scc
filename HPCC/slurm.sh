#!/bin/bash
#SBATCH --job-name=HPCC_ompi_oblas
#SBATCH --partition=k40
#SBATCH -N 3

ml libfabric
source $HPCC/temp/ompivars.sh

mpirun hpcc

