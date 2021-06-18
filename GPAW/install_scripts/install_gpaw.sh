#!/bin/bash

ROOT_DIR=$SCRATCH/GPAW/test$1
$ROOT_DIR/libxc_install.sh $1

if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "Failed, attempting to run the installation again ..."
    sleep 2
    export LC_ALL="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    $ROOT_DIR/libxc_install.sh $1
fi
    
