#!/bin/bash

ml libfabric
ml cmake
source $HPCC/temp/ompivars.sh

cmake .. -DCMAKE_INSTALL_PREFIX=$HPCC/temp/openblas \
-DCMAKE_C_COMPILER=mpicc \
&& make -j install