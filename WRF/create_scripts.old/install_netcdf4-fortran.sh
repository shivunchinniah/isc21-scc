#!/bin/bash
# set install directory to directory that script is called from
install_dir=$(pwd)

# # check if netcdf-c is compiled in deps dir
# if [-d $install_dir/deps/netcdf4]
# then 
#     echo "netcdf4 dir found..."
# else 
#     echo "netcdf4 dir not found in deps, run install_netcdf.sh"
#     exit 1
# fi


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

mkdir build
cd build

# point to netcdf c path
export NCDIR=$install_dir/deps/netcdf4/
export LD_LIBRARY_PATH=${NCDIR}/lib64:${LD_LIBRARY_PATH}

cmake .. \
-DNETCDF_C_LIBRARY=$install_dir/deps/netcdf4/lib64/libnetcdf.so \
-DCMAKE_INSTALL_PREFIX=$intall_dir/deps/netcdf4 \
-DCMAKE_Fortran_COMPILER=mpiifort \
 && make -j 40 install

echo "Installed netcdf-fortran"