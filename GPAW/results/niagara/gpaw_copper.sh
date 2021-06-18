#!/bin/bash
#SBATCH --job-name=gpaw_copper_1 
#SBATCH --nodes=1
#SBATCH --partition=compute  
#SBATCH --ntasks=80
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=1  

module load intel/2020u4
module load intelmpi
module load python/3.8.5

export PATH=$PATH:$HOME/.local/bin
export GPAW_SETUP_PATH=$SCRATCH/GPAW/test4/gpaw-setups-0.9.20000
INPUT_DIR=$SCRATCH/GPAW/test4/gpaw-isc-2021/input-files

mpirun -np 80 --bind-to core gpaw-python $INPUT_DIR/copper.py
