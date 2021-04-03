#!/bin/bash

# This script pulls the WRF source from github and builds it.
# IMPORTANT: this script assumes that netcdf4 (c&fortran) 
# and hdf4 are installed

# clone from git
git clone https://github.com/wrf-model/WRF WRF_ISC21
cd WRF_ISC21
git checkout tags/ISC21 -b ISC21-branch

# load dependancies
ml intel
source ../vars.sh
export NETCDF=$NETCDF_DIR # is set in vars.sh
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export NETCDF_classic=1

./configure

sed -i '/^CFLAGS_LOCAL/s/.*/CFLAGS_LOCAL    =       -w -O3 -ip -DRSL0_ONLY/' configure.wrf

echo "You may now configure the configure.wrf file."
echo "Run:"
echo "./compile -j em_real | tee -a build_wrf.log"
echo "to build WRF ;) to re-build run: ./clean -a"