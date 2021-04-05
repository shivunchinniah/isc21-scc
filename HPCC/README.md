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

2. Load dependancies: libfabric and openmpi via <code>ml libfabric; ml openmpi</code>

3. Compile and install using:
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

4. Build using <br><code>make --arch=Linux_Intel64</code>


## Provisional Setup Intel

1. Download and extract tarball
2. copy Make.Linux_Intel64 into {path to hpcc folder}/hpl folder
3. Edit TOPdir in Make.Linux_Intel64 to point to {path to hpcc folder}/hpl
4. Load intel compiler <code>ml purge; ml intel</code>
5. Move to {path to hpcc folder} and run <code>make arch=Linux_Intel64 -j</code>
6. Done.


## Provisional Results

For these first set of provisional results 2x Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz were used. (k40 rchpc)
28 cores with 128GB RAM each.

hpccinf.txt: `Ns = 148224`, `NBs = 256`, and `P x Q = 4 x 14`

### OpenMPI + OpenBLAS (v1 to be updated)
| HPCCOUTF NAME                       | WEB NAME             | VALUE   | UNITS                   |
|-------------------------------------|----------------------|---------|-------------------------|
| HPL_Tflops                          | G-HPL                | 0.7332  | Tera Flops per Second   |
| PTRANS_GBs                          | G-PTRANS             | 0.0016  | Tera Bytes per Second   |
| MPIRandomAccess_GUPs                | G-RandomAccess       | 0.2235  | Giga Updates per Second |
| MPIFFT_Gflops                       | G-FFT                | 0.0024  | Tera Flops per Second   |
| StarSTREAM_Triad*CommWorldProcs     | EP-STREAM Sys        | 0.1693  | Tera Bytes per Second   |
| StarSTREAM_Triad                    | EP-STREAM Triad      | 3.0224  | Giga Bytes per Second   |
| StarDGEMM_Gflops                    | EP-DGEMM             | 14.2886 | Giga Flops per Second   |
| RandomlyOrderedRingBandwidth_GBytes | RandomRing Bandwidth | 0.4825  | Giga Bytes per second   |
| RandomlyOrderedRingLatency_usec     | RandomRing Latency   | 4.8072  | micro-seconds           |


### Intel CC, MKL & MPI
| HPCCOUTF NAME                       | WEB NAME             | VALUE   | UNITS                   |
|-------------------------------------|----------------------|---------|-------------------------|
| HPL_Tflops                          | G-HPL                | 1.3965  | Tera Flops per Second   |
| PTRANS_GBs                          | G-PTRANS             | 0.0016  | Tera Bytes per Second   |
| MPIRandomAccess_GUPs                | G-RandomAccess       | 0.1377  | Giga Updates per Second |
| MPIFFT_Gflops                       | G-FFT                | 0.0022  | Tera Flops per Second   |
| StarSTREAM_Triad*CommWorldProcs     | EP-STREAM Sys        | 0.1705  | Tera Bytes per Second   |
| StarSTREAM_Triad                    | EP-STREAM Triad      | 3.0453  | Giga Bytes per Second   |
| StarDGEMM_Gflops                    | EP-DGEMM             | 27.1468 | Giga Flops per Second   |
| RandomlyOrderedRingBandwidth_GBytes | RandomRing Bandwidth | 0.4390  | Giga Bytes per second   |
| RandomlyOrderedRingLatency_usec     | RandomRing Latency   | 3.4756  | micro-seconds           |

