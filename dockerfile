# Globus Connect/globus container
# https://www.globus.org/globus-connect-server
# includes globus and Globus Connect
# also includes some network test tools
# Nadya Williams: add globusconnectpersonal tools
# to globus-connect created by John Graham

FROM rockylinux:9
LABEL MAINTAINER Nadya Williams <nwilliams@ucsd.edu>
LABEL CONTRIBUTER Kyle Krick <kkrick@sdsu.edu>

VOLUME /home/globus/globus_config
VOLUME /home/globus/data 

# Install necessary packages
RUN yum -y update && \
    yum -y install wget rsync openssh-clients python pip && \
    yum -y install epel-release && \
    yum -y update && \
    dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm && \
    pip3 install --upgrade globus-cli && \
    adduser globus

RUN cd /root && \
    wget https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz && \
    tar xzvf /root/globusconnectpersonal-latest.tgz -C /home/globus && \
    chown -R globus.globus /home/globus/globus*

# Create directories and adjust permissions
RUN mkdir -p /home/globus/globus_config/.globus && \
    mkdir -p /home/globus/globus_config/.globusonline && \
    mkdir -p /home/globus/data && \
    chown -R globus:globus /home/globus/globus_config && \
    chown -R globus:globus /home/globus/data && \
    chmod -R 755 /home/globus/globus_config && \
    chmod -R 755 /home/globus/data

# Copy the script into the container
COPY globus-connect-personal.sh /home/globus/globus-connect-personal.sh
COPY initialization.sh /home/globus/initialization.sh
COPY entrypoint.sh ./entrypoint.sh

# Make the script executable
RUN chmod +x /home/globus/initialization.sh ./entrypoint.sh /home/globus/globus-connect-personal.sh

# Use the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]

# globus-connect-server-setup script needs these
ENV HOME /root
ENV TERM xterm

# Set default value for RUN_SETUP_SCRIPT
ENV START_GLOBUS=false

