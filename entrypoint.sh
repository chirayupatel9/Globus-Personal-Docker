#!/bin/env bash

if [ "$START_GLOBUS" = "true" ]; then
    echo "Starting Globus Connect Personal"
    su globus -c "cd /home/globus && source ./globus-connect-personal.sh"
else
    su globus -c "cd /home/globus && source ./initialization.sh $DataPath $ConfigPath"
fi

echo setup complete
