# MHM2

## RCHPC

Install GCC from install scripts
Install upcxx
Install MHM
Easy

## Niagara
Niagara provides up to date intel and gcc compiler suites which can be used.  
Currently the install scripts work with gcc for building both upcxx and MHM2.  
Using the intel compiler throws an error "icpc -Wno-catch-value not supported" when compiling mhm  
Slurm script largely copied from HPCAC page  
MHM must be compiled with UPCXX_NETWORK=ibv exported for multi node runs

### Results
Across 4 nodes:
Arctic sample in 40s
Competition input in 617.02s

##Tuning

Parameters that can be tweaked:

- —-max-kmer-store
- —-max-rpcs-in-flight
- —-pin
- —-shared-heap
- —-procs

UPC++ or GASNet options
gasnet.lbl.gov/dist-ex/

2/6  
By default, uses 139Gb of 189Gb  

Final assembly can be found at  mhm2-run-competition1-n160-N4-210602194032/final_assembly.fasta
Overall time taken (including any restarts): 594.09 s

Set max rpc to 70 and got 144gb used. job 5443011. 627.06s :(
Try 30. 5443140. 146GB. Proably not a parameter to tweak. 573.38. Reading the logs it starts at 30 then jumps to 128 for some reason.
Try 1. 5443169. 615.16s.


Ran on 80 threads per node with --pin=core and got 159Gb used. job 5443033. 594.59s.

Default kmer store is 44MB?
Set maxkmer to 50. 5443150. 582.67s.

## Niagara Scaling Analysis

Using the default parameters and testing scaling across different configs we obtained the following:  
| Nodes       | Cores/node  | Runtime | Max memory |
| ----------- | ----------- | ------- | ---------- |
| 1           | 40          | 1561.59 | 68.37      |
| 2           | 20          | 1561.59 | 68.37      |
| 2           | 40          | 1561.59 | 68.37      |
| 3           | 40          | 1561.59 | 68.37      |
| 4           | 40          | 1561.59 | 68.37      |
| 4           | 10          | 1561.59 | 68.37      |
| 4           | 38          | 1561.59 | 68.37      |
| 4           | 40          | 1561.59 | 68.37      |
| 4           | 60          | 1561.59 | 68.37      |
| 4           | 80          | 1561.59 | 68.37      |

set kmer to 54 and rpcs to 1. 5443172. 619.85s
kmer 54 rpcs to 30. 5443174. 611.41s
