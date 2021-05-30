#include "alltoallv_helper.h"
#include <stdlib.h>

using namespace std;

void alltoallv_helper::distributeBuffer(int *counts, int *displacement, int size, int start, int end, int displacement_index /* = 0 */)
{
    for (int i = start; i <= end; i++)
    {
        counts[i] = size;
        displacement[i] = displacement_index++ * counts[i];
    }
}

void alltoallv_helper::randomData(char *data, int size)
{
    for (int i = 0; i < size; i++)
    {
        data[i] = (char)rand();
    }
}

void alltoallv_helper::loadPattern(char *buffer_send, int *counts_send, int *displacement_send, char *buffer_recv, int *counts_recv, int *displacement_recv, Pattern *pattern, int rank)
{

    // delete exsisting buffers and counts
    // delete buffer_send;
    // delete buffer_recv;
    // delete counts_send;
    // delete counts_recv;

    counts_send = new int[pattern->ranks];
    counts_recv = new int[pattern->ranks];

    int buffer_send_size = 0, buffer_recv_size = 0;

    // determine this ranks buffer sizes while setting counts according to pattern->
    for (int i = 0; i < pattern->ranks; i++)
    {
        counts_send[i] = pattern->datamap[rank][i];
        counts_recv[i] = pattern->datamap[i][rank];

        buffer_send_size += pattern->datamap[rank][i];
        buffer_recv_size += pattern->datamap[i][rank];
    }

    // create buffers and populate send buffer with random data.
    buffer_send = new char[buffer_send_size];
    buffer_recv = new char[buffer_recv_size];

    alltoallv_helper::randomData(buffer_send, buffer_send_size);

    int send_index = 0, recv_index = 0;
    // configure displacement send and receive
    for (int i = 0; i < pattern->ranks; i++)
    {
        if (pattern->datamap[rank][i] != 0) // sending data to rank
        {
            displacement_send[i] = send_index;
            send_index += pattern->datamap[rank][i];
        }
        else
        {
            displacement_send[i] = 0;
        }

        if (pattern->datamap[i][rank] != 0) // receiving data from rank
        {
            displacement_recv[i] = recv_index;
            recv_index += pattern->datamap[i][rank];
        }
        else
        {
            displacement_recv[i] = 0;
        }
    }
}

/***
* 
*  Generates a pattern where sending rank i sends data if i%a=0 to all ranks j where j%b=0.
*  The amount of data is sent is specified in an array. As data is assigned sequentially in the map.
*  the index of the array is incremented (and rolls over when the end is reached) to create a 'random pattern'
* 
***/
void alltoallv_helper::modulusPatternGenerator(Pattern *pattern, int a, int b, int *array, int size, int ranks)
{
    //pattern = new Pattern(ranks); // allocate new pattern acording to the rank size

    int size_index = 0;

    for (int i = a; i < ranks; i+=a) // ranks where i%a == 0 
    {
        for(int j = b; j < ranks; j+=b) // ranks where j%b == 0
        {
            pattern->datamap[i][j] = size_index++ % size;
        }
    }


}

void alltoallv_helper::randomPatternGenerator(Pattern *pattern, int exchanges, int min, int max, int ranks, unsigned int seed)
{  

    srand(seed);

    //pattern = new Pattern(ranks);

    for(int i = 0; i< exchanges; i++){
        
        int rank_send = rand() * ranks / RAND_MAX;
        int rank_recv = rand() * ranks / RAND_MAX;
        int data_size = min + (rand() * (max - min) / RAND_MAX);

        pattern->datamap[rank_send][rank_recv] = data_size;
    }
}
