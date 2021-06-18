#!/bin/bash

#SBATCH -N 4
#SBATCH --ntasks-per-node=80
#SBATCH --cpus-per-task=1
#SBATCH -J 1omp80mpi_gpaw
#SBATCH -p compute
#SBATCH -t 2:00:00
#SBATCH --exclusive
#SBATCH -d singleton
#SBATCH -o copper-%j.out

module load NiaEnv/2019b
ml intel
ml intelmpi
ml intelpython3
ml libxc


source $GPAW/shivun/omp/gpawvars.sh

module list

export OMP_NUM_THREADS=1

mpirun -np 320 --bind-to socket gpaw python copper.py
