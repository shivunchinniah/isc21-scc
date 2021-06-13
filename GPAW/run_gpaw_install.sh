#!/bin/bash

# Initialize paths
TEST_NUMBER=4
GPAW=$SCRATCH/GPAW
ROOT_DIR=$GPAW/test$TEST_NUMBER
DOWNLOADS=$ROOT_DIR/downloads
GPAW_DIR=$ROOT_DIR/gpaw-20.10.0

# Descend into ROOT_DIR
cd $ROOT_DIR

# Download GPAW tarball
if [-d $DOWNLOADS ]; then
    wget -O $DOWNLOADS/gpaw-20.10.0.tar.gz https://pypi.org/packages/source/g/gpaw/gpaw-20.10.0.tar.gz
else
    mkdir -p $DOWNLOADS
    wget -O $DOWNLOADS/gpaw-20.10.0.tar.gz https://pypi.org/packages/source/g/gpaw/gpaw-20.10.0.tar.gz
fi

# Install libxc
./run_libxc_install.sh $TEST_NUMBER

# Install GPAW
cp siteconfig.py $GPAW_DIR

echo "Installing GPAW..."
sleep 2

./install_gpaw.sh $TEST_NUMBER