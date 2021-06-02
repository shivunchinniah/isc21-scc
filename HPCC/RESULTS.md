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



