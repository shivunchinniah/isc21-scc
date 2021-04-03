#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/hpcg-3.1.tar.gz

cd $DOWNLOADS

if test -f $tarball; then
    #exists
    echo "Tarball Exisists..."
else
    #doesn't then download
    echo "Downloading tarball..."
   
    wget http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
fi

echo "Removing existing source files..."
sleep 2
rm -rv hpcg-3.1


# extract tarball
echo "Extracting tarball..."
sleep 2
tar xvaf hpcg-3.1.tar.gz

cd hpcg-3.1

#echo "Loading Dependancies..."
#ml libfabric

#echo "Configuring..."
#./configure --prefix=$APPS/openmpi/rchpc_v1/openmpi --with-verbs

#echo "Building... May take a while"
#sleep 3

#Build
#make -j

#echo "Installing..."
#sleep 2

#make install

#echo "Adding Module File"
#mkdir --parents $APPS/modulefiles/openmpi
#cp $SCRIPTS/modulefiles/openmpi/4.1.0.lua $APPS/modulefiles/openmpi/

#echo "DONE!!!"

#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/hpcg-3.1.tar.gz
download=http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
appname=hpcg
appversion=hpcg-3.1
installdir=$HPCG/$appversion

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
cp $HPCG/Make.M setup

echo "Creating directory"
sleep 3
mkdir $installdir

echo "Configuring..."
cd $installdir
/$DOWNLOADS/$appversion/configure M

echo "Building... May take a while"
sleep 3

#Build
make -j

echo "DONE!!!"




