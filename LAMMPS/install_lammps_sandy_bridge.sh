#!/bin/bash

# load dependancies
ml purge
ml intel

orig_path=$(pwd)

# download and extract
if test -f $DOWNLOADS/patch_10Mar2021.tar.gz
then
    echo "File downloaded"
else
    cd $DOWNLOADS
    echo "Downloading..."
    wget https://github.com/lammps/lammps/archive/refs/tags/patch_10Mar2021.tar.gz
fi

cd $LAMMPS/Instances/test2

tar xvaf $DOWNLOADS/patch_10Mar2021.tar.gz

cd lammps-patch_10Mar2021/src

TARGET=intel_cpu_intelmpi
# sed -e "s/xHost/xCORE-AVX512/g" -i MAKE/OPTIONS/Makefile.$TARGET # no need on sandy bridge

make clean-all
make no-all
make no-lib

make yes-manybody yes-molecule yes-replica yes-kspace yes-asphere yes-rigid yes-snap yes-user-omp yes-user-reaxc yes-user-omp
make yes-user-intel
make -j $TARGET


# cmake ../cmake -DCMAKE_INSTALL_PREFIX=$LAMMPS/Instances/Test1/lammps \
# -DCMAKE_C_COMPILER=mpicc \
# && make -j install