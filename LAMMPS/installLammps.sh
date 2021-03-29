#!/bin/bash

ml purge
ml libfabric
ml cmake
ml openmpi

make clean

cmake ../cmake -DCMAKE_INSTALL_PREFIX=$LAMMPS/Instances/Test1/lammps \
-DCMAKE_C_COMPILER=mpicc \
&& make -j install