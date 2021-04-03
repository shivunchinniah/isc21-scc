#!/bin/bash

tarball=$DOWNLOADS/hpcg-3.1.tar.gz
download=http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
appname=hpcg
appversion=hpcg-3.1
installdir=$HPCG/$appversion
arch=M

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
ml openmpi

echo "Copying Makefile"
sleep 3
cp $HPCG/Make.$arch setup

echo "Creating directory"
sleep 3
mkdir $installdir

echo "Configuring..."
cd $installdir
/$DOWNLOADS/$appversion/configure $arch

echo "Building... May take a while"
sleep 3

#Build
make -j

echo "DONE!!!"




