#!/bin/bash
#SBATCH --job-name=LAMMPS_provisional
#SBATCH --partition=k40
#SBATCH -N 2

ml purge
ml intel
ml mkl

mpirun -np 56 lammps-patch_10Mar2021/src/lmp_intel_cpu_intelmpi -in in.lj.txt -pk intel 0 omp 1 -sf intel