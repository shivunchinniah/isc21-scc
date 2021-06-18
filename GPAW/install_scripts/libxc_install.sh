#!/bin/bash

# download
GPAW=$SCRATCH/GPAW
ROOT_DIR=$GPAW/test$1
DOWNLOADS=$ROOT_DIR/downloads
GPAW_DIR=$ROOT_DIR/gpaw-20.10.0
LIBXC_DIR=$GPAW_DIR/libxc-4.3.4

# Extract the GPAW tarball
if [ -d $GPAW_DIR ]; then
    echo "GPAW directory exists descending..."
else
    tar xf $DOWNLOADS/gpaw-20.10.0.tar.gz
fi

cd $GPAW_DIR

# install libxc

if [ -f $DOWNLOADS/libxc-4.3.4.tar.gz ]; then
    echo "File exists"
    if [ -d $LIBXC_DIR ]; then
        echo "Directory exists descending..." 
    else
        tar xfp $DOWNLOADS/libxc-4.3.4.tar.gz
    fi
else
    wget -O $DOWNLOADS/libxc-4.3.4.tar.gz http://www.tddft.org/programs/libxc/down.php?file=4.3.4/libxc-4.3.4.tar.gz
    tar xfp $DOWNLOADS/libxc-4.3.4.tar.gz
fi

cd $LIBXC_DIR

module purge
module load gcc
export CFLAGS="-fPIC"
export CXXFLAGS="-fPIC"
export FCFLAGS="-fPIC"

./configure --prefix=$PWD/install
make -j
make install