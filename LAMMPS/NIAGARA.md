# LAMMPS niagara cluster

## Stable Version 

1. Make a test directory in $SCRATCH/LAMMPS/Instances
2. copy over install_hpxc.sh and modify paths in script
3. copy over install_skylake.sh and modify paths
4. run isntall for skylake the for hpxc
5. load modules <code>module load intel</code> , <code>module load mkl</code> , <code>module load tbb</code>
6. download input files from https://hpcadvisorycouncil-my.sharepoint.com/:u:/p/ophir/EfglJ5DI9glEt1gEqL2Az-YBIupMpjxipCFoKC6WOnRkBw?e=R405an



## Results 

Using Intel Package without Coprocessor.
Ran on 4 CPU's 
# Baseline 

## LJ
<code>
 Loop time of 322.356 on 160 procs for 10000 steps with 16000000 atoms
 Performance: 13401.328 tau/day, 31.022 timesteps/s
 99.7% CPU use with 160 MPI tasks x 1 OpenMP threads
</code>

## Rhodo
<code>
 Loop time of 309.135 on 160 procs for 6000 steps with 2048000 atoms
 Performance: 3.354 ns/day, 7.156 hours/ns, 19.409 timesteps/s
 99.7% CPU use with 160 MPI tasks x 1 OpenMP threads
</code>
