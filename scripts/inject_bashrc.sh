#!/bin/bash

if grep -q "source ~/isc21-scc/scripts/bashrc.append" ~/.bashrc
then 
    echo "Setup Completed previously."
else
    echo "source ~/isc21-scc/scripts/bashrc.append" >> ~/.bashrc
    echo "Setup Completed. Run: `exec bash` to apply changes"
fi


