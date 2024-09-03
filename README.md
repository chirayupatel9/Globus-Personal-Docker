# Globus-Personal-Docker

This repository contains a Dockerfile for building a Docker image that can be used to run a personal Globus Connect Server. The image is based on the [globus/globus-connect-server](https://hub.docker.com/r/globus/globus-connect-server) image, and adds a script that can be used to configure the server with a personal endpoint.

## Building the container

To build the container, run the following command:

```bash
docker build -t globus .
```

## Running the container

You need to start by running the container and doing the initial configuration. The following command will start the container and mount the necessary volumes:

```bash
set $DataPath="D:\\AdobeLightroom\\2023"
set $ConfigPath="D:\\AdobeLightroom\\2023\\config"
DataPath=/home/ubuntu/data
ConfigPath=/home/ubuntu/data/config
docker run -e DataPath=$DataPath \
           -e ConfigPath=$ConfigPath \
           -v "$ConfigPath":/home/gridftp/globus_config \
           -v "$DataPath":/home/gridftp/data \
           -it jagar2/globuspersonaldocker:latest
docker run -e DataPath=$DataPath -e ConfigPath=$ConfigPath -v "$ConfigPath:/home/gridftp/globus_config" -v "$DataPath:/home/gridftp/data" -it jagar2/globuspersonaldocker:latest
```

## Once the Setup is complete the endpoint can be started using the following command:

```bash
DataPath=/home/ubuntu/data/ &&
ConfigPath=/home/ubuntu/data/config &&
docker run -e DataPath="$DataPath"  \
           -e ConfigPath="$ConfigPath" \
           -e START_GLOBUS="true" \
           -v "$ConfigPath":/home/gridftp/globus_config \
           -v "$DataPath":/home/gridftp/data \
           -it jagar2/globuspersonaldocker:latest
```
<!-- 
docker run -e DataPath=$DataPath -e ConfigPath=$ConfigPath -v "$ConfigPath":/home/gridftp/ -v "$DataPath":/home/gridftp/data -it jagar2/globuspersonaldocker:latest -->