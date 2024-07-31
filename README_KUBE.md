# K8 Setup

## Setup

## Prerequisites

Build the persistent volumes

run `kubectl apply -f k8/pvc.yaml`

## Globus Connect

run `kubectl apply -f k8/globus-connect-configure.yaml`

run `kubectl exec -it globus-connect-configure-<pod-number> -- /entrypoint.sh`

## Start the Globus Connect Server

run `kubectl apply -f k8/globus-connect-deployment.yaml`

## Login to DataFed

run `kubectl apply -f k8/datafed-deployment.yaml`

`kubectl exec -it datafed-deployment-6d584bcfb9-65gl8 -- /bin/bash`

`datafed setup`

Follow instructions.