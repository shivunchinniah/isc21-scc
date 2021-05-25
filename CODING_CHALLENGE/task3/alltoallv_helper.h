#ifndef ALLTOALLV_HELPER
#define ALLTOALLV_HELPER

#include <mpi.h>

class alltoallv_helper
{

public:
    /* populates the input char array with randomized data */
    static void randomData(char *data, int size);

    /***
    * 
    * distributes the displacement buffer for ranks start --> end when these ranks 
    * have the same amount of data (number of elements = size) that is sent or recieved from it.
    * displacement_index is where to start distributing in the buffer.
    * 
    ***/
    static void distributeBuffer(int *counts, int *displacement, int size, int start, int end, int displacement_index = 0);

    

    class Pattern
    {
    public:
        int ranks; // number of ranks
        int **datamap;     // datamap[sender][receiver] = exchange size

        Pattern(int ranks)
        {
            this->ranks = ranks;
            this->datamap = new int*[ranks];
            for(int i = 0; i<ranks; i++){
                this->datamap[i] = new int[ranks];
            }
        }

        ~Pattern(){
            for(int i = 0; i< this->ranks; i++){
                delete datamap[i];
            }
            delete datamap;
        }
      
    };

    /***
     * 
     *  populates the send buffer and creates recieve buffer as well as distributing the buffer via
     *  counts and displacments all acording to a 2d array<i,j> where i is the send rank and j is recv rank
     *  the integer value of the array at index<i,j> is the amount of data that i sends to j.
     * 
     ***/
    static void loadPattern(char *buffer_send, int *counts_send, int *displacement_send, char *buffer_recv, int *counts_recv, int *displacement_recv, Pattern pattern, int rank);

    /***
     * 
     *  Generates a pattern where sending rank i sends data if i%a=0 to all ranks j where j%b=0.
     *  The amount of data is sent is specified in an array. As data is assigned sequentially in the map.
     *  the index of the array is incremented (and rolls over when the end is reached) to create a 'random pattern'
     * 
     ***/
    static void modulusPatternGenerator(Pattern *pattern, int a, int b, int * array, int size);

    /***
     * simply sends a random amount of data from a random rank to a random rank, the number of exchanges is passed as a parameter.
     * The actual number of exchanges may be lower as a send-receive rank pair may be written to multible times
     * The data size ranges from min to max.
     ***/
    static void randomPatternGenerator(Pattern *pattern, int exchanges, int min, int max);

};

#endif