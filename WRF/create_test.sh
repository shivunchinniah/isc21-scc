#!/bin/bash


# This script simply creates a new test directory and copies
# install scripts over to it.


# create a new test
folder_name=test_$(date '+%m%d%H%M')
mkdir --parent tests/$folder_name

cd tests/$folder_name

# copy install scripts

cp $WRF/create_scripts/* .

# edit vars script

sed -i "s/{test_dir}/$folder_name/g" vars.sh

echo "You can now cd into: $WRF/tests/$folder_name"

