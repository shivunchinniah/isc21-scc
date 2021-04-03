#!/bin/bash

# see


# set install directory to directory that script is called from
install_dir=$(pwd)

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


#export ZDIR=$install_dir/deps # for libz

export H5DIR=$install_dir/deps/hdf5
export LD_LIBRARY_PATH=$install_dir/deps/lib:$install_dir/deps/hdf5/lib:$LD_LIBRARY_PATH

CC=mpiicc \
LDFLAGS="-L${H5DIR}/lib -L${install_dir}/lib" \
CPPFLAGS="-I${H5DIR}/include -I${install_dir}/include"  \
./configure --prefix=$install_dir/deps/netcdf4 --disable-dap

make check -j
make -j install

# not using cmake because error with libcurl and lib64 for some reason
# cmake .. -DCMAKE_INSTALL_PREFIX=$install_dir/deps/netcdf4 \
# -DHDF5_ROOT=$install_dir/deps/hdf5 \
# -DCMAKE_C_COMPILER=mpicc \
# -DHDF5_IS_PARALLEL_MPIO=1 \
# -DENABLE_DAP=OFF \
#  && make -j install

 echo "Installed netcdf-c in $install_dir/deps"