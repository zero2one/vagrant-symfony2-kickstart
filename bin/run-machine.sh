#!/bin/bash

echo "> Starting Virtual Machine"

# Lets run this from the vagrant base directory.
SCRIPT_SOURCE="${BASH_SOURCE[0]}"
VAGRANT_ROOT="$SCRIPT_SOURCE/../"


# Start the VM.
vagrant up
echo

# Update the environment with composer
bin/composer-update.sh

exit
