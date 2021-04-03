#!/bin/bash
# set install directory to directory that script is called from
install_dir=$(pwd)


# Download and extract netcdf-c
# netcdf
if test -f $DOWNLOADS/netcdf-fortran-4.5.3.tar.gz
then
    echo "Found netcdf tarball"
else
    cd $DOWNLOADS
    echo "Downloading netcdf-fortran"
    wget https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-fortran-4.5.3.tar.gz
    
fi

mkdir $install_dir/source
cd $install_dir/source

tar xvaf $DOWNLOADS/netcdf-fortran-4.5.3.tar.gz
cd netcdf-fortran-4.5.3


# load modules
ml purge
ml intel


# point to netcdf c path
export NCDIR=$install_dir/deps/netcdf4
export LD_LIBRARY_PATH=$NCDIR/lib:$LD_LIBRARY_PATH
export NFDIR=$NCDIR


CC=mpiicc \ 
FC=mpiifort \
CPPFLAGS=-I${NCDIR}/include \
LDFLAGS=-L${NCDIR}/lib \
./configure --prefix=${NFDIR}

make check
make -j install

echo "Installed netcdf-fortran"