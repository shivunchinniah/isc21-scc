#!/bin/bash
source $HOME/apps/lmod/8.4/init/bash

ml purge
ml icc
ml cmake

# export FC=mpifc
# export LDFLAGS="-L/home/witsteam1/fnemo/deps/netcdf4/lib64"
# # export CXX=/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/bin/mpicc
# # export CC=/home/witsteam1/apps/intel/compilers_and_libraries_2020.4.304/linux/mpi/intel64/bin/mpicc
# export LIBS="-lnetcdf"
# export CPPFLAGS="-I/home/witsteam1/fnemo/deps/netcdf4/include"
# export NCDIR=/home/witsteam1/fnemo/deps/netcdf4/
# export LD_LIBRARY_PATH=${NCDIR}/lib64:${LD_LIBRARY_PATH}

# ./configure --with-fortran --disable-shared --enable-parallel --prefix=/home/witsteam1/fnemo/deps/netcdf4 

# gmake -j 40 all
# #make -j 20 check
# gmake install

mkdir build
cd build

export NCDIR=/home/witsteam1/fnemo/deps/netcdf4/
export LD_LIBRARY_PATH=${NCDIR}/lib64:${LD_LIBRARY_PATH}

cmake .. \
-DNETCDF_C_LIBRARY=/home/witsteam1/fnemo/deps/netcdf4/lib64/libnetcdf.so \
-DCMAKE_INSTALL_PREFIX=/home/witsteam1/fnemo/deps/netcdf4 \
-DCMAKE_Fortran_COMPILER=mpifc \
 && make -j 40 install

 #-DNETCDF_C_LIBRARY=/home/witsteam1/fnemo/deps/netcdf4/lib64/libnetcdf.so 