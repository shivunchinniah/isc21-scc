#!/bin/bash

# This script pulls the WRF source from github and builds it.
# IMPORTANT: this script assumes that netcdf4 (c,fortran&python) 
# and hdf4 are installed

# clone from git
git clone https://github.com/wrf-model/WRF WRF_ISC21
cd WRF_ISC21
git checkout tags/ISC21 -b ISC21-branch

cd ../
install_dir=$(pwd)

cd WRF_ISC21

# load dependancies
ml intel
deps=$install_dir/deps

export LD_LIBRARY_PATH=$deps/netcdf4/lib:$deps/hdf5/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$deps/netcdf4/lib:$deps/hdf5/lib:$LIBRARY_PATH

export NETCDF_DIR=$deps/netcdf4
export NETCDF=$NETCDF_DIR # is set in vars.sh
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export NETCDF_classic=1

./configure

sed -i '/^CFLAGS_LOCAL/s/.*/CFLAGS_LOCAL    =       -w -O3 -ip -DRSL0_ONLY/' configure.wrf

echo "You may now configure the configure.wrf file."
echo "Run:"
echo "./compile -j em_real 2>&1 build_wrf.log"
echo "to build WRF and to re-build first clean with: ./clean -a"