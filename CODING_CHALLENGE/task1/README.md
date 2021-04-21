# Task 1 - Understanding alltoallv calls

## Context
This task folder contains two subfolders: `unbalanced` and `balanced`
containing the source code, a build script, a slurm script and a sample output from running the slurm job for both patterns.

## Needs Fixing
- The balanced pattern creates a send buffer for the second half of the ranks for each node and populates these buffers. These buffers will not be used at all. 

## Task Description

Write a program with an input flag for pattern, on the Niagara cluster using 4 nodes, each with 40 ppn (full), total of 160 ppn.

The program should run 1000 iterations of MPI_alltoallv using the following characteristics.

Assuming the ranks mapping is as follows:

ranks 0-39 → node 1

ranks 40-79 → node 2

ranks 80-119 → node 3

ranks 120-159 → node 4

 

MPI_alltoallv unbalanced Pattern:

- ranks 0-39 on node 1 are sending 1MB to ranks 40-79 on node 2, and 0B to the rest (40*40MB)

- ranks 40-79 on nodes 2 are sending 1MB to ranks 0-39 on node 1, and 0B to the rest (40*40MB)

- ranks 80-159 on nodes 3,4 are sending 0B to all ranks.

MPI_alltoallv balanced Pattern:

- ranks 0-19 ranks on nodes 1 are sending 1MB to ranks 40-59 and to ranks 80-99 (20*40MB)

- ranks 40-59 ranks on nodes 2 are sending 1MB to ranks 100-119 and to ranks 120-139 (20*40MB)

- ranks 80-99 ranks on nodes 3 are sending 1MB to ranks 140-159 and to ranks 0-19 (20*40MB)

- ranks 120-139 ranks on nodes 4 are sending 1MB to ranks 20-39 and to ranks 60-79 (20*40MB)

 

Compare the time it takes on both patterns. What are the differences, why? 

Submit the code and results (zip file)

