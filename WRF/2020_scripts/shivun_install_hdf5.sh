#!/bin/bash
source $HOME/apps/lmod/8.4/init/bash

ml purge
ml icc
ml cmake

mkdir build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=/home/witsteam1/fnemo/deps/hdf5 \
-DHDF5_ENABLE_PARALLEL=1 -DHDF5_ENABLE_Z_LIB_SUPPORT=1 \
-DHDF5_ENABLE_SZIP_SUPPORT=1  -DHDF5_BUILD_CPP_LIB=0 \
&& make -j 40 install