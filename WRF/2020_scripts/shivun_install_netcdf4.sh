#!/bin/bash
source $HOME/apps/lmod/8.4/init/bash

ml purge
ml icc # international cricket cup????
ml cmake

mkdir build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=/home/witsteam1/fnemo/deps/netcdf4 \
-DHDF5_ROOT=/home/witsteam1/fnemo/deps/hdf5 \
-DCMAKE_C_COMPILER=mpicc \
-DHDF5_IS_PARALLEL_MPIO=1 \
 && make -j 40 install