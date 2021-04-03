#!/bin/bash

$deps=$WRF/tests/{test_dir}/deps

export LD_LIBRARY_PATH=$deps/netcdf4/lib64:$deps/hdf5/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$deps/netcdf4/lib64:$deps/hdf5/lib:$LIBRARY_PATH

export NETCDF_DIR=$deps/netcdf4