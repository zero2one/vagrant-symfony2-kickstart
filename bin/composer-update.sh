#!/bin/bash

echo "> Running Composer update in VM..."

# Lets run this from the vagrant base directory.
SCRIPT_SOURCE="${BASH_SOURCE[0]}"
VAGRANT_ROOT="$SCRIPT_SOURCE/../"

# Run the composer command over ssh.
cd "$VAGRANT_SOURCE"
vagrant ssh -c "composer update -d /var/www/symfony/"

echo
exit
