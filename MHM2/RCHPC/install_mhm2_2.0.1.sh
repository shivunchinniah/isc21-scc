#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/mhm2-2.0.1.tar.gz
download=https://bitbucket.org/berkeleylab/mhm2/downloads/mhm2-2.0.1.tar.gz
appname=mhm2
appversion=mhm2-2.0.1
installdir=$MHM2/$appversion

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
ml gcc
ml openmpi
ml upcxx
ml cmake

echo "Configuring..."
export CXX=mpicxx
export CC=mpicc
export MHM2_INSTALL_PATH=$installdir

echo "Building... May take a while"
sleep 3

#Build
./build.sh Release

echo "DONE!!!"


