#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/openmpi-4.1.0.tar.gz
download=https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.0.tar.gz
appname=openmpi
appversion=openmpi-4.1.0_icc
installdir=$APPS/$appname/$appversion

cd $DOWNLOADS

if test -f $tarball; then
    #exists
    echo "Tarball Exisists..."
else
    #doesn't then download
    echo "Downloading tarball..."
   
    wget $download
fi

mkdir ompi_icc
cd ompi_icc

echo "Removing existing source files..."
sleep 2
rm -rv $appversion


echo "Removing existing installation"
sleep 2
rm -rv $installdir

# extract tarball
echo "Extracting tarball..."
sleep 2
tar xvaf $DOWNLOADS/$tarball

cd openmpi-4.1.0

echo "Loading Dependancies..."
ml libfabric
ml intel


echo "Configuring..."
CC=icc FC=ifort CXX=icpc ./configure --prefix=$installdir

echo "Building... May take a while"
sleep 3

#Build
make -j

echo "Installing..."
sleep 2

make install

echo "Adding Module File"
mkdir --parents $APPS/modulefiles/openmpi
cp $SCRIPTS/modulefiles/openmpi/4.1.0_icc.lua $APPS/modulefiles/openmpi/
# update ml cache
module --ignore_cache avail > /dev/null

echo "DONE!!!"




