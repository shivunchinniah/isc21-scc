#!/bin/bash

version=2020.3.2
now=$(date +%Y%m%d_%H%M%S)

mkdir "~/.trash/mhm2$now"

mv ~/apps/upcxx "~/.trash/mhm2$now"

mv "upcxx-$version"  "~/.trash/mhm2$now/src"

tar xvaf "upcxx-$version.tar*"

cp shivun_install_upcxx.sh "upcxx-$version"
