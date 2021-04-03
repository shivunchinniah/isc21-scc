#!/bin/bash
cd $DOWNLOADS
if test -f OpenBLAS-0.3.13.tar.gz
then 
    echo "File exists"
else 
    wget --content-disposition https://github.com/xianyi/OpenBLAS/releases/download/v0.3.13/OpenBLAS-0.3.13.tar.gz
fi 
cd $GPAW
tar xvf $DOWNLOADS/OpenBLAS-0.3.13.tar.gz
cd OpenBLAS-0.3.13
mkdir build
cd build
ml libfabric 
ml cmake
ml openmpi

cmake .. -DCMAKE_INSTALL_PREFIX=$GPAW/openblas \
-DCMAKE_C_COMPILER=mpicc \
&& make -j install