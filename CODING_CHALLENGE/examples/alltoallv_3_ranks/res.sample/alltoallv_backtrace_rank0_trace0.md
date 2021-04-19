FORMAT_VERSION: 9

stack trace for /home/schinniah/isc21-scc/CODING_CHALLENGE/helloWorldMPI/all2alltest/a.out pid=101114

# Trace

/home/schinniah/profiler/src/alltoallv/liballtoallv_backtrace.so(_mpi_alltoallv+0xa3) [0x7fd78ea1f9b0]
/home/schinniah/profiler/src/alltoallv/liballtoallv_backtrace.so(MPI_Alltoallv+0x5a) [0x7fd78ea1fc87]
./a.out() [0x400d8f]
/lib64/libc.so.6(__libc_start_main+0xf5) [0x7fd78d915505]
./a.out() [0x400919]

# Context 0

Communicator: 0
Communicator rank: 0
COMM_WORLD rank: 0
Calls: 0

