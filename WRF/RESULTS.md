# Results for WRF

## Submission Criteria

1. Runs must be completed on 4 Niagara compute nodes.
2. Submit Timing results (rsl.out.0000 and namelist.output.0000) Save Raw ISC2021_WRF_* files in directory.
3. Analyze the difference between AVX2 and AVX512 --> For interview.
4. Present performance differences considering OpenMP and OpenMPI (what combinations work best) + what other things where tried.
5. Run the IPM profile on the run (PDF file)
6. Generate a figure from WRF output and submit the results (PDF)


## Results

### Baseline AVX2 1 OMP Thread:
WRF RUN COMPLETED \
MPI ranks used: 10 x 16 = 160 \
Domain size : \
 ids,ide,jds,jde            1         793           1         853 \
 ids,ide,jds,jde            1         805           1         805 \
 ids,ide,jds,jde            1        1001           1        1001 \
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   1 \
Average Time for radiation:      35.6371 ± 0.0735572 s (7 times) \
Average Time for non-radiation:  17.9425 ± 0.024331 s (88 times) \
Total Time:                    1828.4 s (95 times) 


### AVX2 with 2 OMP Thred (Making use of hyperthreading):
WRF RUN COMPLETED \
MPI ranks used: 10 x 16 = 160 \
Domain size : \
 ids,ide,jds,jde            1         793           1         853 \
 ids,ide,jds,jde            1         805           1         805 \
 ids,ide,jds,jde            1        1001           1        1001 \
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   2 \
Average Time for radiation:      32.8302 ± 0.143271 s (7 times) \
Average Time for non-radiation:  16.8819 ± 0.0712411 s (88 times) \
Total Time:                    1715.42 s (95 times)

### AVX512 with 1 OMP Thread:
WRF RUN COMPLETED \
MPI ranks used: 10 x 16 = 160 \
Domain size : \
 ids,ide,jds,jde            1         793           1         853 \
 ids,ide,jds,jde            1         805           1         805 \
 ids,ide,jds,jde            1        1001           1        1001 \
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   1 \
Average Time for radiation:      39.3032 ± 0.0132193 s (7 times) \
Average Time for non-radiation:  17.7987 ± 0.0295895 s (88 times) \
Total Time:                    1841.41 s (95 times)

### AVX2 with 1 OMP Thread (running last step of alltoallv profiler): 
WRF RUN COMPLETED \
MPI ranks used: 10 x 16 = 160 \
Domain size : \
 ids,ide,jds,jde            1         793           1         853 \
 ids,ide,jds,jde            1         805           1         805 \
 ids,ide,jds,jde            1        1001           1        1001 \
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   1 \
Average Time for radiation:      35.4383 ± 0.05705 s (7 times) \
Average Time for non-radiation:  17.8406 ± 0.141185 s (88 times) \
Total Time:                    1818.04 s (95 times)

### AVX2 with 4 OMP Threads (80 MPI):
WRF RUN COMPLETED \
MPI ranks used: 8 x 10 = 80 \
Domain size : \
 ids,ide,jds,jde            1         793           1         853 \
 ids,ide,jds,jde            1         805           1         805 \
 ids,ide,jds,jde            1        1001           1        1001 \
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   4 \
Average Time for radiation:      65.6785 ± 0.119139 s (7 times) \
Average Time for non-radiation:  35.9413 ± 0.10064 s (88 times) \
Total Time:                    3622.58 s (95 times) 


### AVX2 with 1 OMP Thread (320MPI) --bind-to thread (none):
WRF RUN COMPLETED \
MPI ranks used: 16 x 20 = 320 \
Domain size : \
 ids,ide,jds,jde            1         793           1         853 \
 ids,ide,jds,jde            1         805           1         805 \
 ids,ide,jds,jde            1        1001           1        1001 \
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   1 \
Average Time for radiation:      35.5593 ± 0.426923 s (7 times) \
Average Time for non-radiation:  19.287 ± 0.608121 s (88 times) \
Total Time:                    1946.17 s (95 times)


### Rebuild of WRF OMP --bind-to socket (40 MPI) (4 OMP)

MPI ranks used: 5 x 8 = 40 \
Domain size :\
 ids,ide,jds,jde            1         793           1         853\
 ids,ide,jds,jde            1         805           1         805\
 ids,ide,jds,jde            1        1001           1        1001\
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   4\
Average Time for radiation:      34.9186 ± 0.0565364 s (7 times)\
Average Time for non-radiation:  18.5131 ± 0.0715623 s (88 times)\
Total Time:                    1873.58 s (95 times)



### Rebuild of WRF OMP --bind-to socket (80 MPI) (2 OMP)
WRF RUN COMPLETED\
MPI ranks used: 8 x 10 = 80\
Domain size :\
 ids,ide,jds,jde            1         793           1         853\
 ids,ide,jds,jde            1         805           1         805\
 ids,ide,jds,jde            1        1001           1        1001\
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   2\
Average Time for radiation:      33.9296 ± 0.202176 s (7 times)\
Average Time for non-radiation:  17.3558 ± 0.0662265 s (88 times)\
Total Time:                    1764.82 s (95 times)\

### Rebuild WRF (80 MPI) (4 OMP) --bind-to socket
MPI ranks used: 8 x 10 = 80\
Domain size :\
 ids,ide,jds,jde            1         793           1         853\
 ids,ide,jds,jde            1         805           1         805\
 ids,ide,jds,jde            1        1001           1        1001\
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   4\
Average Time for radiation:      34.0993 ± 0.174861 s (7 times)\
Average Time for non-radiation:  17.7108 ± 0.134086 s (88 times)\
Total Time:                    1797.24 s (95 times)\

### Rebuild WRF (160 MPI) (2 OMP) --bind-to socket
WRF RUN COMPLETED\
MPI ranks used: 10 x 16 = 160\
Domain size :\
 ids,ide,jds,jde            1         793           1         853\
 ids,ide,jds,jde            1         805           1         805\
 ids,ide,jds,jde            1        1001           1        1001\
WRF NUMBER OF TILES FROM OMP_GET_MAX_THREADS =   2\
Average Time for radiation:      33.4283 ± 0.0616088 s (7 times)\
Average Time for non-radiation:  17.076 ± 0.0831013 s (88 times)\
Total Time:                    1736.69 s (95 times)\


