# Build:
# docker build --rm -t mediainbox/streammachine:master .
#
# Create:
# docker create -it -m="512m" -p 8000-8020:8000-8020 --name StreamMachine-master -h StreamMachine-master mediainbox/streammachine:master
#
# Start:
# docker start --net=host StreamMachine-master
#
# Connect with bash:
# docker logs StreamMachine-master
#
# Connect URL:
# http://127.0.0.1:8020/


# Pull base image
FROM ubuntu:14.04

# Maintener
MAINTAINER Alejandro Ferrari <aferrari@mediainbox.net>

# Change localtime
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime


# Create base directories
RUN mkdir -p /var/log/StreamMachine

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    nodejs \
    npm \
    git \
    nodejs-legacy \
    wget \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

#Download and Install
RUN cd /srv; git clone https://github.com/StreamMachine/StreamMachine.git
RUN cd /srv/StreamMachine; npm install

# Copy config file
ADD config/master.json /srv/StreamMachine/config

# Mountable directories
VOLUME ["/var/log/StreamMachine", "/srv/StreamMachine"]

# Working directory
WORKDIR /srv/StreamMachine

# Endpoint
CMD ["--config", "/srv/StreamMachine/config/master.json"]
ENTRYPOINT ["/srv/StreamMachine/streammachine-cmd"]

# Expose ports.
EXPOSE 8000-8020
