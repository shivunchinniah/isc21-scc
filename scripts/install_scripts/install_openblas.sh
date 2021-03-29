#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/OpenBLAS-0.3.13.tar.gz
download=https://github.com/xianyi/OpenBLAS/releases/download/v0.3.13/OpenBLAS-0.3.13.tar.gz
appname=openblas
appversion=OpenBLAS-0.3.13
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

echo "Removing existing source files..."
sleep 2
rm -rv $appversion


echo "Removing existing installation"
sleep 2
rm -rv $installdir

# extract tarball
echo "Extracting tarball..."
sleep 2
tar xvaf $tarball

cd $appversion

echo "Loading Dependancies..."
ml libfabric
ml cmake
ml openmpi

echo "Making Build Dir"
mkdir build
cd build

echo "Installing... May take a while"
cmake .. -DCMAKE_INSTALL_PREFIX=$installdir \
-DCMAKE_C_COMPILER=mpicc \
&& make -j install

echo "DONE!!!"