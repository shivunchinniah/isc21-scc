#!/bin/bash

ml purge
ml openmpi

#
mpicxx -c -Wall all2all.cpp
if [ $? -ne 0 ]; then
  echo "Compile error."
  exit
fi
#
mpicxx all2all.o
if [ $? -ne 0 ]; then
  echo "Load error."
  exit
fi
rm all2all.o
#
echo "Normal end of execution."

