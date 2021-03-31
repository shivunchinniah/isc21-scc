#!/bin/bash
wget https://lammps.sandia.gov/download.html.
tar xf lammps-stable.tar.gz
cd lammps-29Oct20/src
TARGET=intel_cpu_openmpi
sed -e "s/xHost/xCORE-AVX512/g" -i MAKE/OPTIONS/Makefile.$TARGET

make clean-all
make no-all
make no-lib

make yes-manybody yes-molecule yes-replica yes-kspace yes-asphere yes-rigid yes-snap yes-user-omp yes-user-reaxc yes-user-omp
make yes-user-intel
make -j 32 $TARGET