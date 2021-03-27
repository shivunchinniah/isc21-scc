#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/openmpi-4.1.0.tar.gz

cd $DOWNLOADS

if test -f $tarball; then
    #exists
    echo "Tarball Exisists..."
else
    #doesn't then download
    echo "Downloading tarball..."
   
    wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.0.tar.gz
fi

echo "Removing existing source files..."
sleep 2
rm -rv openmpi-4.1.0


# extract tarball
echo "Extracting tarball..."
sleep 2
tar xvaf openmpi-4.1.0.tar.gz

cd openmpi-4.1.0

echo "Loading Dependancies..."
ml libfabric

echo "Configuring..."
./configure --prefix=$APPS/openmpi/rchpc_v1/openmpi --with-verbs

echo "Building... May take a while"
sleep 3

#Build
make -j

echo "Installing..."
sleep 2

make install

echo "Adding Module File"
mkdir --parents $APPS/modulefiles/openmpi
cp $SCRIPTS/modulefiles/openmpi/4.1.0.lua $APPS/modulefiles/openmpi/

echo "DONE!!!"




