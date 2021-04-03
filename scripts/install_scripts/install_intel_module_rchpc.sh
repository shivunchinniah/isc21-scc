#!/bin/bash

### This file copies the .lua file from $SCRIPTS/intel/xxx.lua
### to $APPS/modulefiles/intel/xxx.lua

file_name=2020.4.912.lua
file_path=modulefiles/intel

intelpython3=3.7.7.lua
intelpython3_path=modulefiles/intelpython3

# if test -f $APPS/$file_path/$filename
# then
#     echo "Module file alreaddy added."

# else
mkdir --parent $APPS/$file_path
mkdir --parent $APPS/$intelpython3_path
cp $SCRIPTS/$file_path/$file_name $APPS/$file_path
cp $SCRIPTS/$intelpython3_path/$intelpython3 $APPS/$intelpython3_path
echo "Module files copied!"

# update ml cache
ml --ignore_cache avail > /dev/null 2>&1
# fi