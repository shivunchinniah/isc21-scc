#!/bin/bash

deps=$WRF/tests/{test_dir}/deps

export LD_LIBRARY_PATH=$deps/lib:$deps/netcdf4/lib:$deps/hdf5/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$deps/lib:$deps/netcdf4/lib:$deps/hdf5/lib:$LIBRARY_PATH

export NETCDF_DIR=$deps/netcdf4

export PATH=$deps/netcdf4/bin:$deps/bin:$PATH # for nf-conf

