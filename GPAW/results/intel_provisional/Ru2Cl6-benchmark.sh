#!/bin/bash
#SBATCH --job-name=Ru2Cl6-benchmark
#SBATCH --partition=v100
#SBATCH --time=6:00:00
#SBATCH --nodes=2
#SBATCH --ntasks=56


#source conda envrionment here or source gpaw module here

ml purge
ml intel
ml intelpython3


mpirun -np 56 gpaw python Ru2Cl6-benchmark.py

grep Free Ru2Cl6-benchmark.txt
grep Total: Ru2Cl6-benchmark.txt
