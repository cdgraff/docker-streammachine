# Build:
# docker build --rm -t mediainbox/streammachine:slave .
#
# Create:
# docker create -it -m="512m" -p 80:80 --name StreamMachine-slave -h StreamMachine-slave --link=StreamMachine-master mediainbox/streammachine:slave
#
# Start:
# docker start StreamMachine-slave
#
# Connect with bash:
# docker logs StreamMachine-slave
#
# Connect URL:
# http://127.0.0.1:80/


# Pull base image
FROM cdgraff/ffmpeg

# Maintener
MAINTAINER Alejandro Ferrari <aferrari@mediainbox.net>

# Change localtime
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime


# Create base directories
RUN mkdir -p /var/log/StreamMachine

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update ; DEBIAN_FRONTEND=noninteractive apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs git wget \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*


#Download and Install
RUN cd /srv; git clone https://github.com/StreamMachine/StreamMachine.git
RUN cd /srv/StreamMachine; npm install

# Copy config file
RUN mkdir -p /srv/StreamMachine/config
ADD config/slave.json /srv/StreamMachine/config/

# Mountable directories
VOLUME ["/var/log/StreamMachine", "/srv/StreamMachine"]

# Working directory
WORKDIR /srv/StreamMachine

# Endpoint
CMD ["--config", "/srv/StreamMachine/config/slave.json"]
ENTRYPOINT ["/srv/StreamMachine/streammachine-cmd"]

# Expose ports.
EXPOSE 80
