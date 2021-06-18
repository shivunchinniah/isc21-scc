#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <string.h>

/*****

This is a more simple version of task one meant to be run on two nodes (simulate 4 nodes)

Each node has 28 cores and we will map 1 rank / core

ranks 0-13  (Node1)
ranks 14-27 (Node2)
ranks 28-41 (Node3)
ranks 42-55 (Node4)

Unbalanced Pattern: 
Ranks of Node1 send 1MB to all ranks of Node2
Ranks of Node2 send 1MB to all ranks of Node1
Nodes 3 and 4 send and receive 0MB of data to and from all ranks.

MPI_alltoallv:

buffer_send --> the buffer to store the sending elements
counts_send --> array containing number of sending elements for each process
displacements_send --> position of the element in the send buffer
datatype_send --> the data type of the send buffer elements
buffer_recv --> the buffer to store the recieved elements
counts_recv --> array containing number of receiving elements for each process
displacements_recv --> position of element in receive buffer
datatype_recv --> data type of the receive buffer elements
commuicator --> MPI_COMM_WORLD

*****/
const int NODE1_START = 0;
const int NODE1_END = 39;

const int NODE2_START = 40;
const int NODE2_END = 79;

const int NODE3_START = 80;
const int NODE3_END = 199;

const int NODE4_START = 120;
const int NODE4_END = 159;

// Declare Functions
void randomData(char *data, int size);
void exchange(int id, int p, int p_target, int ittr);
void distributeBuffer(int *counts, int *displacement, int size, int start, int end, int displacement_index = 0);

int main(int argc, char *argv[])
{

    MPI_Init(&argc, &argv);
    // Get the number of processes must be 56
    int p;
    MPI_Comm_size(MPI_COMM_WORLD, &p);

    const int p_target = 160;
    if (p != p_target)
    {
        printf("%d processes are needed.\n", p_target);
        MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
    }

    //Get My Rank
    int my_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    // peform ittr Alltoalv calls
    exchange(my_rank, p, p_target, 1000);

    MPI_Finalize();
    return EXIT_SUCCESS;
}

void exchange(int my_rank, int p, int p_target, int ittr)
{

    //Define 1MB in bytes
    int megabyte = (1024 * 1024); // 1B -> 1KiB -> 1MiB

    //Define buffers
    char *buffer_send;
    char *buffer_receive;
    int quarter_p = p_target / 4;

    if (my_rank >= NODE1_START && my_rank <= NODE1_END)
    {
        buffer_send = new char[(megabyte * quarter_p)];
        buffer_receive = new char[(megabyte * quarter_p)];
        randomData(buffer_send, quarter_p * megabyte);
    }
    else if (my_rank >= NODE2_START && my_rank <= NODE2_END)
    {
        buffer_send = new char[(megabyte * quarter_p)];
        buffer_receive = new char[(megabyte * quarter_p)];
        randomData(buffer_send, quarter_p * megabyte);
    }
    else
    {
        buffer_send = new char[0];
        buffer_receive = new char[0];
    }

    int *counts_send = new int[p_target];       // create a count for each process to send
    int *counts_recv = new int[p_target];       // create a count to receve from each process
    int *displacement_send = new int[p_target]; // create an array to store displacements for how the send buffer will be divided
    int *displacement_recv = new int[p_target]; // create an array to store displacements for how the receive buffer will be divided

    // initialise arrays with 0s
    for (int i = 0; i < p_target; i++)
    {
        counts_send[i] = 0; // the process sends 0 elements
        counts_recv[i] = 0; // the process recieves 0 elements
        displacement_send[i] = 0;
        displacement_recv[i] = 0;
    }

    if (my_rank >= NODE1_START && my_rank <= NODE1_END) // Node1 Rank
    {
        // NODE1 process send 1MB to Node2 processes
        distributeBuffer(counts_send, displacement_send, megabyte, NODE2_START, NODE2_END);

        // Node1 Process receive 1MB from Node2 processes
        distributeBuffer(counts_recv, displacement_recv, megabyte, NODE2_START, NODE2_END);
    }
    else if (my_rank >= NODE2_START && my_rank <= NODE2_END) // Node2 Rank
    {
        // NODE2 process send 1MB to Node1 processes
        distributeBuffer(counts_send, displacement_send, megabyte, NODE1_START, NODE1_END);

        // Node2 Process receive 1MB from Node1 processes
        distributeBuffer(counts_recv, displacement_recv, megabyte, NODE1_START, NODE1_END);
    }
    
    // No data for Nodes 3&4 ranks

    // send MPI_Alltoallv call

    for (int i = 0; i < ittr; i++)
    {
        MPI_Alltoallv(buffer_send, counts_send, displacement_send, MPI_CHAR, buffer_receive, counts_recv, displacement_recv, MPI_CHAR, MPI_COMM_WORLD);
        if (my_rank == 0)
        {
            printf("%d of %d \n", i + 1, ittr); // print the itteration
        }
    }
    delete buffer_receive;
    delete buffer_send;
    delete counts_send;
    delete counts_recv;
    delete displacement_send;
    delete displacement_recv;
}

// function to generate size bytes of random data
void randomData(char *data, int size)
{
    for (int i = 0; i < size; i++)
    {
        data[i] = (char)rand();
    }
}

// start and end inclusive
void distributeBuffer(int *counts, int *displacement, int size, int start, int end, int displacement_index /* = 0 */)
{
    for (int i = start; i <= end; i++)
    {
        counts[i] = size;
        displacement[i] = displacement_index++ * counts[i];
    }
}
