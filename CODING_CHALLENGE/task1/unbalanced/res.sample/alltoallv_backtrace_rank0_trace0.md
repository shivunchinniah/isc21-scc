FORMAT_VERSION: 9

stack trace for /home/schinniah/isc21-scc/CODING_CHALLENGE/task1/unbalanced/a.out pid=48820

# Trace

/home/schinniah/profiler/src/alltoallv/liballtoallv_backtrace.so(_mpi_alltoallv+0xa3) [0x7fab373529b0]
/home/schinniah/profiler/src/alltoallv/liballtoallv_backtrace.so(MPI_Alltoallv+0x5a) [0x7fab37352c87]
./a.out() [0x400d61]
./a.out() [0x400a4a]
/lib64/libc.so.6(__libc_start_main+0xf5) [0x7fab36249495]
./a.out() [0x4008f9]

# Context 0

Communicator: 0
Communicator rank: 0
COMM_WORLD rank: 0
Calls: 0-999

