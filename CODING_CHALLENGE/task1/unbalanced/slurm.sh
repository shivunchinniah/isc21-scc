#!/bin/bash
#SBATCH --job-name=alltoallv_unbalanced_mpi_test
#SBATCH --partition=k40
#SBATCH --time=6:00:00
#SBATCH --ntasks=56

ml purge
ml openmpi

export A2A_PROFILING_OUTPUT_DIR=$CODE/task1/unbalanced/res

COUNTSFLAGS="/home/schinniah/profiler/src/alltoallv/liballtoallv_counts.so"
MAPFLAGS="/home/schinniah/profiler/src/alltoallv/liballtoallv_location.so"
BACKTRACEFLAGS="/home/schinniah/profiler/src/alltoallv/liballtoallv_backtrace.so"
A2ATIMINGFLAGS="/home/schinniah/profiler/src/alltoallv/liballtoallv_exec_timings.so"
LATETIMINGFLAGS="/home/schinniah/profiler/src/alltoallv/liballtoallv_late_arrival.so"

MPIFLAGS+="-x A2A_PROFILING_OUTPUT_DIR "
MPIFLAGS+="-x LD_LIBRARY_PATH "

mpirun -np 56 -bind-to core $MPIFLAGS -x LD_PRELOAD="$COUNTSFLAGS"  ./a.out 
mpirun -np 56 -bind-to core $MPIFLAGS -x LD_PRELOAD="$MAPFLAGS"  ./a.out 
mpirun -np 56 -bind-to core $MPIFLAGS -x LD_PRELOAD="$BACKTRACEFLAGS"  ./a.out 
mpirun -np 56 -bind-to core $MPIFLAGS -x LD_PRELOAD="$A2ATIMINGFLAGS"  ./a.out 
mpirun -np 56 -bind-to core $MPIFLAGS -x LD_PRELOAD="$LATETIMINGFLAGS"  ./a.out 