#!/bin/bash -login 
# ----------------------------------------------------------------------------
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=40
#SBATCH --threads-per-core=1
#SBATCH -J 60kmer100rpcs
#SBATCH -o %j.out
#SBATCH --time=0:20:00
#SBATCH --exclusive
#SBATCH -d singleton
# ----------------------------------------------------------------------------
HOST=$SLURM_JOB_NUM_NODES
PPN=$SLURM_NTASKS_PER_NODE
NP=$SLURM_NPROCS
DATE=$(date +%Y%m%d-%H%M)

BASE=/home/l/lcl_uotiscscc/lcl_uotiscsccs1041/isc21-scc/MHM2
ulimit -s unlimited

# OpenMP settings
export OMP_NUM_THREADS=1

ml upcxx

export PATH=$BASE/mhm2-2.0.1/bin:$PATH
export GASNET_IBV_PORTS="mlx5_0:1"
export GASNET_PHYSMEM_PROBE=0 
export GASNET_ODP_VERBOSE=0

input=/home/l/lcl_uotiscscc/lcl_uotiscsccs1041/isc21-scc/downloads/competition1.fastq
mhm2.py -r $input --checkpoint=no --max-kmer-store=60 --max-rpcs-in-flight=100 
