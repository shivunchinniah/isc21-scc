#!/bin/bash

cd $DOWNLOADS/nano-5.6.1

echo "Uninstalling..."
sleep 1
make uninstall

rm $SCRIPTS/uninstall_nano.sh

echo "Done!"
