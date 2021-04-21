#!/bin/sh

ml purge
ml icc

make clean

export CXX=/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/bin/mpiicpc -gxx-name=/home/mdindar/.conda/envs/basal/bin/x86_64-conda_cos6-linux-gnu-g++ -gcc-name=/home/mdindar/.conda/envs/basal/bin/x86_64-conda_cos6-linux-gnu-gcc
export CC=/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/bin/mpiicc
export LDFLAGS="-Wl,-rpath,/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/libfabric/lib"
export LIBS="-lfabric"

./configure --prefix=$ISC/apps/upcxx  --with-default-network=ibv \


gmake -j 20 all
#make -j 20 check
gmake install
