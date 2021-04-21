#! /bin/bash
#
source_code=task_1_unbalanced

mpicxx -c -Wall $source_code.cpp
if [ $? -ne 0 ]; then
  echo "Compile error."
  exit
fi
#
mpicxx $source_code.o
if [ $? -ne 0 ]; then
  echo "Load error."
  exit
fi
rm $source_code.o
test -f slurm*out && mkdir out;  mv slurm*out ./out/ # move existing slurm output files to out directory
#
echo "Normal end of execution."