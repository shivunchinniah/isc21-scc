#!/bin/bash

now=$(date +%Y%m%d_%H%M%S)
version=2.0.0

mkdir "~/.trash/mhm2$now"

mv ~/apps/mhm2 "~/.trash/mhm2$now"

mv "mhm2-$version" "~/.trash/mhm2$now/src"

tar xvaf "mhm2-$version.tar*"
