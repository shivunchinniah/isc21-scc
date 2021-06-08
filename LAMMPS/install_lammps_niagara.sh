# load dependancies
ml purge
module load intel
module load tbb
module use $SCRATCH/LAMMPS/Instances/test1/hpcx-v2.7.0-gcc-MLNX_OFED_LINUX-5.1-0.6.6.0-redhat7.6-x86_64/modulefiles/
module load hpcx

# download and extract
if test -f $SCRATCH/downloads/lammps-29Oct20
then
    echo "File downloaded"
else
    cd $SCRATCH/downloads
    echo "Downloading..."
    wget https://download.lammps.org/tars/lammps-stable.tar.gz
fi

cd $SCRATCH/LAMMPS/Instances/test1

tar xf $SCRATCH/downloads/lammps-stable.tar.gz

cd lammps-29Oct20/src

TARGET=intel_cpu_openmpi
sed -e "s/xHost/xCORE-AVX512/g" -i MAKE/OPTIONS/Makefile.$TARGET

make clean-all
make no-all
make no-lib

make yes-manybody yes-molecule yes-replica yes-kspace yes-asphere yes-rigid yes-snap yes-user-omp yes-user-reaxc yes-user-omp
make yes-user-intel
make -j 16 $TARGET
