#!/bin/bash

#get test dir
install_dir=$(pwd)

# Download and extract tarball
tarball=$DOWNLOADS/curl-7.76.0.tar.gz

cd $DOWNLOADS

if test -f $tarball; then
    #exists
    echo "Tarball Exisists..."
else
    #doesn't then download
    echo "Downloading tarball..."
   
    wget https://curl.se/download/curl-7.76.0.tar.gz
fi

cd $install_dir/source

echo "Removing existing source files..."
sleep 2
rm -rv curl-7.76.0


# extract tarball
echo "Extracting tarball..."
sleep 2
tar xvaf $DOWNLOADS/curl-7.76.0.tar.gz

cd curl-7.76.0

echo "Loading Dependancies..."
ml purge
ml intel

echo "Configuring..."
CC=icc ./configure --prefix=$install_dir/deps

echo "Building... May take a while"
sleep 3

#Build
make -j

echo "Installing..."
sleep 2

make install


echo "DONE!!!"




