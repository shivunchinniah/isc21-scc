#!/bin/bash

# Download and extract tarball

tarball=$DOWNLOADS/nano-5.6.1.tar.gz

cd $DOWNLOADS

if test -f $tarball; then
    #exists
    echo "Tarball Exisists..."
else
    #doesn't then download
    echo "Downloading tarball..."
   
    wget https://www.nano-editor.org/dist/v5/nano-5.6.1.tar.gz
fi


echo "Removing existing source files..."
sleep 1
rm -rv nano-5.6.1


# extract tarball
echo "Extracting tarball..."
sleep 1
tar xvaf nano-5.6.1.tar.gz

cd nano-5.6.1


echo "Configuring..."
./configure --prefix=$APPS

echo "Building... May take a while"
sleep 2

#Build
make -j

echo "Installing..."
sleep 2

make install

echo "Creating Uninstall Script in: $(echo $SCRIPT)"
sleep 1

cp $SCRIPTS/uninstall_scripts/uninstall_nano.sh $SCRIPTS


echo "DONE!!! try using nano now."