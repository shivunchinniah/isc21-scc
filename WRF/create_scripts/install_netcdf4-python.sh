#!/bin/bash


# see  http://unidata.github.io/netcdf4-python/#install

# set install directory to directory that script is called from
install_dir=$(pwd)

app=netcdf4-python
version=1.5.6rel

# Download and extract netcdf-python
# netcdf
if test -f $DOWNLOADS/v$version.tar.gz
then
    echo "Found netcdf tarball"
else
    cd $DOWNLOADS
    echo "Downloading netcdf-fortran"
    wget https://github.com/Unidata/netcdf4-python/archive/refs/tags/v1.5.6rel.tar.gz
    
fi

mkdir $install_dir/source
cd $install_dir/source

tar xvaf $DOWNLOADS/v$version.tar.gz
cd $app-$version


# load modules
ml purge
ml intel
ml intelpython3


# point to netcdf c path
export NCDIR=$install_dir/deps/netcdf4
export NETCDF_DIR=$NCDIR
export LD_LIBRARY_PATH=$NCDIR/lib:$LD_LIBRARY_PATH
export NFDIR=$NCDIR


python setup.py build --prefix=$NCDIR

python setup.py install --prefix=$NCDIR


echo "Installed netcdf-python"