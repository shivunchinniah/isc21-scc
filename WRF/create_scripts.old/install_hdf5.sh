#!/bin/bash

# set install directory to directory that script is called from
install_dir=$(pwd)


# Download and extract hdf5
# netcdf
if test -f $DOWNLOADS/hdf5-1.12.0.tar.gz
then
    echo "Found hdf5 tarball"
else
    cd $DOWNLOADS
    echo "Downloading netcdf"
    wget https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_1_12_0/source/hdf5-1.12.0.tar.gz
    
fi

mkdir $install_dir/source
cd $install_dir/source

tar xvaf $DOWNLOADS/hdf5-1.12.0.tar.gz

cd hdf5-1.12.0

# load modules
ml purge
ml intel
ml cmake

mkdir build_hdf
cd build_hdfls

cmake .. -DCMAKE_INSTALL_PREFIX=$install_dir/deps/hdf5 \
-DHDF5_ENABLE_PARALLEL=1 -DHDF5_ENABLE_Z_LIB_SUPPORT=1 \
-DHDF5_ENABLE_SZIP_SUPPORT=1  -DHDF5_BUILD_CPP_LIB=0 \
-DCMAKE_C_COMPILER=mpiicc \
&& make -j install

echo "Installed hdf5 in $install_dir/deps"


