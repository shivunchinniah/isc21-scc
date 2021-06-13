#!/bin/bash

GPAW_DIR=$SCRATCH/GPAW/test$1/gpaw-20.10.0

module purge
module load intel
module load conda3
module load intelmpi

export PYTHONUSERBASE=$GPAW_DIR
export GPAW_CONFIG=$GPAW_DIR/siteconfig.py

cd $GPAW_DIR

pip3 install -v gpaw --user
