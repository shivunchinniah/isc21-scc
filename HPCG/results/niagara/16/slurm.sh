#!/bin/bash
#SBATCH --job-name=HPCG_c
#SBATCH --partition=compute
#SBATCH -N 4
#SBATCH --ntasks=160
#SBATCH --time=01:00:00
#SBATCH --ntasks-per-node=40

ml intel 
ml intelmpi

mpirun   -np 160 ./xhpcg
