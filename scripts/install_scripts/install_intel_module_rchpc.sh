#!/bin/bash

### This file copies the .lua file from $SCRIPTS/intel/xxx.lua
### to $APPS/modulefiles/intel/xxx.lua

file_name=2020.4.912.lua
file_path=modulefiles/intel

if test -f $APPS/$file_path/$filename
then
    echo "Module file alreaddy added."

else
    mkdir --parent $APPS/$file_path
    cp $SCRIPTS/$file_path/$file_name $APPS/$file_path
    echo "Module file copied!"

    # update ml cache
    module --ignore_cache avail > /dev/null
fi