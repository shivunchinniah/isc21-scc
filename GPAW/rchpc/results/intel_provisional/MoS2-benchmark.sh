#!/bin/bash
#SBATCH --job-name=MoS2-benchmark
#SBATCH --partition=v100
#SBATCH --time=6:00:00
#SBATCH --nodes=2
#SBATCH --ntasks=56


conda activate

ml purge
ml intel
ml intelpython3


mpirun -np 56 gpaw python MoS2-benchmark.py

grep Free MoS2-benchmark.txt
grep Total: MoS2-benchmark.txt