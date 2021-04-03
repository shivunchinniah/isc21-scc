#!/bin/bash

# set install directory to directory that script is called from
install_dir=$(pwd)

# check if hdf5 is compiled in deps dir
# if [-d $install_dir/deps/hdf5]
# then 
#     echo "HDF5 dir found..."
# else 
#     echo "HDF5 dir not found in deps, run install_hdf5.sh"
#     exit 1
# fi


# Download and extract netcdf-c
# netcdf
if test -f $DOWNLOADS/netcdf-c-4.7.4.tar.gz
then
    "Found netcdf tarball"
else
    cd $DOWNLOADS
    echo "Downloading netcdf"
    wget https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-c-4.7.4.tar.gz
    
fi

mkdir $install_dir/source
cd $install_dir/source

tar xvaf $DOWNLOADS/netcdf-c-4.7.4.tar.gz

cd netcdf-c-4.7.4

# load modules
ml purge
ml intel
ml cmake

mkdir build
cd build

# to do check if libcurl is installed

cmake .. -DCMAKE_INSTALL_PREFIX=$install_dir/deps/netcdf4 \
-DHDF5_ROOT=$install_dir/deps/hdf5 \
-DCMAKE_C_COMPILER=mpicc \
-DHDF5_IS_PARALLEL_MPIO=1 \
-DENABLE_DAP=OFF \
 && make -j install

 echo "Installed netcdf-c in $install_dir/deps"