#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/go1.16.3.linux-amd64.tar.gz

cd $DOWNLOADS

if test -f $tarball; then
    #exists
    echo "Tarball Exisists..."
else
    #doesn't then download
    echo "Downloading tarball..."
   
    wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
fi


# echo "Removing existing source files..."
# sleep 1
# rm -rv go

cd $APPS

# extract tarball
echo "Extracting tarball..."
sleep 1
tar xvaf $DOWNLOADS/go1.16.3.linux-amd64.tar.gz


# install module file
echo "Installing Modulefile..."
cp -r $SCRIPTS/modulefiles/go $APPS/modulefiles

echo "DONE!!! Go is installed in home directory load module file"
echo "You may have to run: 'ml --ignore_cache avail' to see the new module"