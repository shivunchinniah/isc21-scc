# LAMMPS Research


## To do: 
Find references to potential modifications for each experiment. Discuss what these modifications would change + predictions.

## Expermients:

These experiments outline what needs to be done for optimizing LAMMPS for the competition.

### Experiment 1
OpenMP Threads + Affinity

Run test with intel build with OpenMP support test different processor dispositions for two nodes on Research cluster.

### Experiment 2
Run GPU Accelerated runs.

### Experiment 3 
Baseline conditions are no OpenMP threads, i.e. one rank per processor.
With Intel. 4 nodes only.

- Get a baseline For GPU accelerated on NSCC
- Get baseline for CPU on NSCC
- Get baseline for CPU on Niagra (AVX512 support)

The result from this experemint will determine if running a combination of CPU and GPU is worth while.

Niagra has newer CPUs with double core count, but does not have GPUs.

It might be the case that the GPUs on NSCC are faster


### Expermiment 4 
Run the alltoallv profiler with LAMMPS see if there is anything interesting


## Results0
The results from the experiments will be listed here.