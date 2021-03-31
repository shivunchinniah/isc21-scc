#!/bin/bash
libxc_version=4.3.4
cd $DOWNLOADS
if test -f libxc-$libxc_version.tar.gz
then 
    echo "File exists"
else 
    wget --content-disposition http://www.tddft.org/programs/libxc/down.php?file=$libxc_version/libxc-$libxc_version.tar.gz
fi 
cd $GPAW

tar xzf $DOWNLOADS/libxc-$libxc_version.tar.gz
cd libxc-$libxc_version
export CFLAGS="-O3 -fPIC" # -fPIC is needed as libxc will be used from shared library
./configure --prefix=$GPAW/libxc/$libxc_version
make -j
make install
export CPATH=$CPATH:$GPAW/libxc/$libxc_version/include
export LIBRARY_PATH=$LIBRARY_PATH:$GPAW/libxc/$libxc_version/lib