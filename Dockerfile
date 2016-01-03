# Build:
# docker build -t mediainbox/streammachine:latest .
#
# Create:
# docker create -it -m="512m" -p 0.0.0.0:8000:8000-8020:8020 --name StreamMachine-master -h StreamMachine-master mediainbox/streammachine:latest
#
# Start:
# docker start StreamMachine-master
#
# Connect with bash:
# docker exec -it StreamMachine-master bash
#
# Connect URL:
# http://127.0.0.1:8000/


# Pull base image
FROM ubuntu:14.04

# Maintener
MAINTAINER Alejandro Ferrari <aferrari@mediainbox.net>

# Change localtime
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime


# Create base directories
RUN mkdir -p /var/log/StreamMachine

# Install dependencies
RUN apt-get update -y ; apt-get upgrade -y
RUN apt-get install -y nodejs npm git nodejs-legacy wget

#Download and Install
RUN cd /srv; git clone https://github.com/StreamMachine/StreamMachine.git
RUN cd /srv/StreamMachine; npm install

# Copy config file
ADD config/master.json /srv/StreamMachine/config
ADD config/slave.json /srv/StreamMachine/config

# Mountable directories
VOLUME ["/var/log/StreamMachine", "/srv/StreamMachine"]

# Working directory
WORKDIR /srv/StreamMachine

# Endpoint
ENTRYPOINT ["/srv/StreamMachine/streammachine-cmd"]
CMD ["--config", "/srv/StreamMachine/config/${ROLE}.json"]

# Expose ports.
EXPOSE 8000-8020
