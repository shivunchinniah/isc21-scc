# LAMMPS 
Large-scale Atomic/Molecular Massively Parallel Simulator

## Provisional Version 

1. Download and extract source from github releases: https://github.com/lammps/lammps/releases

2. make a instance: <code>cd $LAMMPS; mkdir --parents Instances/Test{x}
cd Instances/Test{x}</code>

3. copy $LAMMPS/install_lamps_sandy_bridge.sh script to $LAMMPS/Instances/Test{x} and run

4. LAMMPS should be built. Download test file https://lammps.sandia.gov/bench/in.lj.txt and copy the example slurm script

See slurm_provisional_v1.sh for running instructions

### Provisional Results:
<code>
Loop time of 0.0768569 on 56 procs for 100 steps with 32000 atoms
 
Performance: 562083.771 tau/day, 1301.120 timesteps/s
98.0% CPU use with 56 MPI tasks x 1 OpenMP threads
</code>

is 1,64 x faster than on a single node 
 
and is 4,4 x slower than 4 nodes with 11x more total cores
