#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/upcxx-2020.3.2.tar.gz
download=https://bitbucket.org/berkeleylab/upcxx/downloads/upcxx-2020.3.2.tar.gz
appname=upcxx
appversion=upcxx-2020.3.2
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
ml gcc

echo "Configuring..."
./configure --prefix=$installdir --with-cc=gcc --with-cxx=g++

echo "Building... May take a while"
sleep 3

#Build
gmake -j 10 all

echo "Installing..."
sleep 2

make install

echo "Adding Module File"
mkdir --parents $APPS/modulefiles/upcxx
rm $APPS/upcxx/2020.3.2
cp $installdir/share/modulefiles/upcxx/2020.3.2 $APPS/modulefiles/upcxx/
# update ml cache
module --ignore_cache avail > /dev/null

echo "DONE!!!"


