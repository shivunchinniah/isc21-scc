# 3 Rank Example MPI Alltoallv

## Code
See the file `all2all.cpp`

## Build
See the file `build.sh`, you should be able to run this script if modules (LMOD --> openmpi) are set up.

## Run
Once the a.out binary has been built you can run <code>sbatch slurm.sh</code>
Before you do this ensure that you set the 'profiler' variable in the script to point to your collective_profiler path.
You have to build the profiler first so that the libraries exist.

## Sample output from the profiler
See the `res.sample` folder for sample output from the profiler. 
Note that this is the raw output. You can run {YOUR_PROFILER_DIR}/tools/cmd/profiler/profiler -h to see the help page of the post-profiler

## Task 1 
Will be added soon...
