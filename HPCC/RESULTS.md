# Results for HPCC

## Niagara

### Baseline with AVX512 (icc impi)

HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         6.2157|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0047|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.5447|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0064|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.5999|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         3.7495|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        51.7310|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.4006|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         2.6147|   micro-seconds

Ns = 121785
NBs = 256

Ps x Pq = 10 x 16

### Baseline with AVX2 (icc impi)
HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         6.3060|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0048|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.5730|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0065|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.5985|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         3.7404|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        54.0265|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.3979|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         2.5972|   micro-seconds

Ns = 121785
NBs = 256

Ps x Pq = 10 x 16

### AVX2 (icc impi) 84% Mem use:
HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         6.7175|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0041|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.5280|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0067|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.5996|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         3.7477|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        52.8247|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.4051|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         2.5812|   micro-seconds

Ns = 187382
NBs = 256

Ps x Pq = 10 x 16

### AVX2 icc impi better use of memory
HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         6.8961|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0036|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.5349|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0071|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.6409|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         4.0057|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        50.5274|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.3981|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         2.2075|   micro-seconds

Ns = 211200
NBs = 384

Ps x Pq = 10 x 16

### final push
HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         6.8986|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0042|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.5284|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0072|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.6433|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         4.0209|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        52.6284|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.3962|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         2.4658|   micro-seconds

Ns = 230400
NBs = 384

Ps x Pq = 10 x 16


## NSCC


### Baseline
HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         2.1120|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0018|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.0499|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0027|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.1808|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         1.8834|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        33.6737|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.6174|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         1.1170|   micro-seconds

Ns = 179200
NBs = 256
Ps x Pq = 8 x 12

### Faster
HPCCOUTF NAME        |                WEB NAME         |            VALUE |  UNITS
----------------------|---------------------------------|------------------|--------------------
HPL_Tflops                         |  G-HPL               |         2.1481|   Tera Flops per Second
PTRANS_GBs                         |  G-PTRANS            |         0.0019|   Tera Bytes per Second
MPIRandomAccess_GUPs               |  G-RandomAccess      |         0.0481|   Giga Updates per Second
MPIFFT_Gflops                      |  G-FFT               |         0.0027|   Tera Flops per Second
StarSTREAM_Triad*CommWorldProcs    |  EP-STREAM Sys       |         0.2187|   Tera Bytes per Second
StarSTREAM_Triad                   |  EP-STREAM Triad     |         2.2783|   Giga Bytes per Second
StarDGEMM_Gflops                   |  EP-DGEMM            |        34.4884|   Giga Flops per Second
RandomlyOrderedRingBandwidth_GBytes|  RandomRing Bandwidth|         0.5921|   Giga Bytes per second
RandomlyOrderedRingLatency_usec    |  RandomRing Latency  |         1.0801|   micro-seconds


Ns = 2000448
NBs = 384
Ps x Pq = 8 x 12



