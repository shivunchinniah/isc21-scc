#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <string.h>
#include "alltoallv_helper.h"

/*****

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
const int NODE3_END = 119;

const int NODE4_START = 120;
const int NODE4_END = 159;

const int RANKS = 160;

// Create a struct for  MPI_alltoallv parameters

struct alltoallv_params
{
    char *buffer_send = nullptr;
    int *counts_send;
    int *displacements_send;
    MPI_Datatype datatype_send = MPI_CHAR;
    char *buffer_recv = nullptr;
    int *counts_recv;
    int *displacements_recv;
    MPI_Datatype datatype_recv = MPI_CHAR;
    MPI_Comm communicator = MPI_COMM_WORLD;

    alltoallv_params(){
        counts_send = new int[RANKS];
        displacements_send = new int[RANKS];
        counts_recv = new int[RANKS];
        displacements_recv = new int[RANKS];
    }

    ~alltoallv_params(){
        if(buffer_send) delete[] buffer_send;
        if(buffer_recv) delete[] buffer_recv;
        if(counts_send) delete[] counts_send;
        if(counts_recv) delete[] counts_recv;
        if(displacements_recv) delete[] displacements_recv;
        if(displacements_send) delete[] displacements_send;
    }
};

int main(int argc, char *argv[])
{

    MPI_Init(&argc, &argv);
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

    // For this test there are 6 patterns 4 random and
    // 2 modulus patterns
    alltoallv_helper::Pattern pattern1 = alltoallv_helper::Pattern(p_target);
    alltoallv_helper::Pattern pattern2 = alltoallv_helper::Pattern(p_target);
    alltoallv_helper::Pattern pattern3 = alltoallv_helper::Pattern(p_target);
    alltoallv_helper::Pattern pattern4 = alltoallv_helper::Pattern(p_target);
    alltoallv_helper::Pattern pattern5 = alltoallv_helper::Pattern(p_target);
    alltoallv_helper::Pattern pattern6 = alltoallv_helper::Pattern(p_target);
    
    // generate random patterns
    alltoallv_helper::randomPatternGenerator(pattern1, 20, 1, 100, p_target, 5114);
    alltoallv_helper::randomPatternGenerator(pattern2, 25, 1, 100, p_target, 3417);
    alltoallv_helper::randomPatternGenerator(pattern3, 30, 1, 100, p_target, 4598);
    alltoallv_helper::randomPatternGenerator(pattern4, 40, 1, 100, p_target, 904);
    

    int x[10] = {23, 10, 20, 25, 14, 6, 11, 1, 24, 4};
    // generate modulus patterns
    alltoallv_helper::modulusPatternGenerator(pattern5, 7, 13, &x[0], 10, p_target);
    alltoallv_helper::modulusPatternGenerator(pattern6, 17, 23, &x[0], 7, p_target);
    

    // load the parameters for all the patterns
    alltoallv_params params1;
    alltoallv_helper::loadPattern(params1.buffer_send, params1.counts_send, params1.displacements_send, params1.buffer_recv, params1.counts_recv, params1.displacements_recv, pattern1, my_rank);
    

    alltoallv_params params2;
    alltoallv_helper::loadPattern(params2.buffer_send, params2.counts_send, params2.displacements_send, params2.buffer_recv, params2.counts_recv, params2.displacements_recv, pattern2, my_rank);

    alltoallv_params params3;
    alltoallv_helper::loadPattern(params3.buffer_send, params3.counts_send, params3.displacements_send, params3.buffer_recv, params3.counts_recv, params3.displacements_recv, pattern3, my_rank);

    alltoallv_params params4;
    alltoallv_helper::loadPattern(params4.buffer_send, params4.counts_send, params4.displacements_send, params4.buffer_recv, params4.counts_recv, params4.displacements_recv, pattern4, my_rank);

    alltoallv_params params5;
    alltoallv_helper::loadPattern(params5.buffer_send, params5.counts_send, params5.displacements_send, params5.buffer_recv, params5.counts_recv, params5.displacements_recv, pattern5, my_rank);

    alltoallv_params params6;
    alltoallv_helper::loadPattern(params6.buffer_send, params6.counts_send, params6.displacements_send, params6.buffer_recv, params6.counts_recv, params6.displacements_recv, pattern6, my_rank);

    srand(697);

    for (int i = 0; i < 500; i++)
    {

        int index = rand() % 80;

        if(index < 10 ){
        MPI_Alltoallv(params1.buffer_send, params1.counts_send, params1.displacements_send, params1.datatype_send, params1.buffer_recv, params1.counts_recv, params1.displacements_recv, params1.datatype_recv, params1.communicator);
        }
        else if (index>= 10 && index< 25)
        {
           MPI_Alltoallv(params2.buffer_send, params2.counts_send, params2.displacements_send, params2.datatype_send, params2.buffer_recv, params2.counts_recv, params2.displacements_recv, params2.datatype_recv, params2.communicator);
        }
        else if (index>= 25 && index< 35)
        {
            MPI_Alltoallv(params3.buffer_send, params3.counts_send, params3.displacements_send, params3.datatype_send, params3.buffer_recv, params3.counts_recv, params3.displacements_recv, params3.datatype_recv, params3.communicator);
        }
        else if (index>= 35 && index< 58)
        {
            MPI_Alltoallv(params4.buffer_send, params4.counts_send, params4.displacements_send, params4.datatype_send, params4.buffer_recv, params4.counts_recv, params4.displacements_recv, params4.datatype_recv, params4.communicator);
        }
        else if (index<= 58 && index< 70)
        {
           MPI_Alltoallv(params5.buffer_send, params5.counts_send, params5.displacements_send, params5.datatype_send, params5.buffer_recv, params5.counts_recv, params5.displacements_recv, params5.datatype_recv, params5.communicator);
        }
        else
        {
           MPI_Alltoallv(params6.buffer_send, params6.counts_send, params6.displacements_send, params6.datatype_send, params6.buffer_recv, params6.counts_recv, params6.displacements_recv, params6.datatype_recv, params6.communicator);
        }
    }

    MPI_Finalize();

    return EXIT_SUCCESS;
}
