#!/bin/env bash

# Set permissions for shared-data
mkdir -p /shared-data
chmod -R 777 /shared-data

if [ "$START_GLOBUS" = "true" ]; then
    echo "Starting Globus Connect Personal"
    su gridftp -c "cd /home/gridftp && source ./globus-connect-personal.sh"
    echo "Calling from here"
else
    su gridftp -c "cd /home/gridftp && source ./initialization.sh"
    echo "Calling from there"

fi

echo setup complete

# Keep the terminal open
tail -f /dev/null