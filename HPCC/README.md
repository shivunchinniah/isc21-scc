# HPCC

For the competition instructions refere to http://icl.cs.utk.edu/hpcc/

## CHPC Research

V100 - Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz
k40 - Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz
k80 - Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz


## Provisional Setup (OpenMPI + OpenBLAS)


### Install OpenMPI

1. Download and extract OpenMPI from internet (use gooogle)

2. Load OFI v1.8.x <code>ml libfabric</code>

3. Run configure <code>./configure --prefix=$HPCC/temp/openmpi --with-verbs</code>

4. Build <code>make -j</code>

5. Install <code>make install</code>


### Install OpenBlas

1. Download & extract latest version of OpenBLAS from https://www.openblas.net/

2. Compile and install using:
<code> 
mkdir build; cd build;

cmake .. -DCMAKE_INSTALL_PREFIX=$HPCC/temp/openblas \
-DCMAKE_C_COMPILER=mpicc \
&& make -j install
</code>

note: cmake v3, openmpi,  and libfabric dependancies


1. Download latest version of HPCC from https://icl.utk.edu/hpcc/software/index.html <br>
<code>wget http://icl.cs.utk.edu/projectsfiles/hpcc/download/hpcc-1.5.0.tar.gz </code>

2. Extract tarball

3. Copy arh

4. Build using <br><code>make --arch=Linux_Intel64