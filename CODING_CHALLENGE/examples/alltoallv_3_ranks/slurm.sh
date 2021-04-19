#!/bin/bash
#SBATCH --job-name=alltoall_3_rank_test
#SBATCH --partition=k40
#SBATCH --time=6:00:00
#SBATCH --ntasks=3

ml purge
ml openmpi

export A2A_PROFILING_OUTPUT_DIR=$CODE/examples/alltoallv_3_ranks/res

# this might be named collective_profiler on your system
profiler=/home/schinniah/profiler

COUNTSFLAGS="$profiler/src/alltoallv/liballtoallv_counts.so"
MAPFLAGS="$profiler/src/alltoallv/liballtoallv_location.so"
BACKTRACEFLAGS="$profiler/src/alltoallv/liballtoallv_backtrace.so"
A2ATIMINGFLAGS="$profiler/src/alltoallv/liballtoallv_exec_timings.so"
LATETIMINGFLAGS="$profiler/src/alltoallv/liballtoallv_late_arrival.so"

MPIFLAGS+="-x A2A_PROFILING_OUTPUT_DIR "
MPIFLAGS+="-x LD_LIBRARY_PATH "

mpirun -np 3 -bind-to core $MPIFLAGS -x LD_PRELOAD="$COUNTSFLAGS"  ./a.out 
mpirun -np 3 -bind-to core $MPIFLAGS -x LD_PRELOAD="$MAPFLAGS"  ./a.out 
mpirun -np 3 -bind-to core $MPIFLAGS -x LD_PRELOAD="$BACKTRACEFLAGS"  ./a.out 
mpirun -np 3 -bind-to core $MPIFLAGS -x LD_PRELOAD="$A2ATIMINGFLAGS"  ./a.out 
mpirun -np 3 -bind-to core $MPIFLAGS -x LD_PRELOAD="$LATETIMINGFLAGS"  ./a.out 
