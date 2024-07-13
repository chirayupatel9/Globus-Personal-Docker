#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <DataPath> <ConfigPath>"
    exit 1
fi

# Assign input arguments to variables
DataPath=$1
ConfigPath=$2
    
# Inside the container: Setup the Globus Personal Endpoint
globus login --no-local-server

# Collect information about the endpoint
endpoint_info=$(globus endpoint create --personal myep 2>&1)

# Extract the Endpoint ID and Setup Key from the output
endpoint_id=$(echo "$endpoint_info" | grep -oP "Endpoint ID: \K[0-9a-f-]+")
setup_key=$(echo "$endpoint_info" | grep -oP "Setup Key: \K[0-9a-f-]+")

# Set the environment variables
export GLOBUS_ENDPOINT_ID="$endpoint_id"
export GLOBUS_SETUP_KEY="$setup_key"

# Change to the Globus Connect Personal directory
cd /home/globus/globusconnectpersonal-*/

# Finish the Endpoint Setup
./globusconnectpersonal -setup $GLOBUS_SETUP_KEY

# Add Path and Start the Endpoint
echo "$DataPath,0,1" >> ~/.globusonline/lta/config-paths

# Copy the Globus configuration to the host directory
cp -p -r /home/globus/.globus* /home/globus/configpath