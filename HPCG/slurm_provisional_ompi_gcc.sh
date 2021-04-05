#!/bin/bash
#SBATCH --job-name=HPCG_ompi_gcc
#SBATCH --partition=v100
#SBATCH -N 2

ml purge
ml openmpi

mpirun ./xhpcg