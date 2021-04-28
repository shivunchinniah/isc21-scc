# LAMMPS Research


## To do: 
Find references to potential modifications for each experiment. Discuss what these modifications would change + predictions.

## Expermients:

These experiments outline what needs to be done for optimizing LAMMPS for the competition.

### Experiment 1
OpenMP Threads + Affinity

Run test with intel build with OpenMP support test different processor dispositions for two nodes on Research cluster.

#### Results
Test with no OMP threads and no intel accelerator package:\
<code>
Loop time of 0.0898221 on 56 procs for 100 steps with 32000 atoms

Performance: 480950.718 tau/day, 1113.312 timesteps/s\
98.9% CPU use with 56 MPI tasks x 1 OpenMP threads\
</code>

Test with no OMP threads and intel accelerator package:\
<code>
Loop time of 0.0862444 on 56 procs for 100 steps with 32000 atoms

Performance: 500901.853 tau/day, 1159.495 timesteps/s\
97.6% CPU use with 56 MPI tasks x 1 OpenMP threads\
</code>


Test with OMP threads (2 for Hyperthreading) and intel accelerator package:\
<code>
Loop time of 0.081764 on 112 procs for 100 steps with 32000 atoms

Performance: 528349.811 tau/day, 1223.032 timesteps/s\
97.1% CPU use with 56 MPI tasks x 2 OpenMP threads\
</code>

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
