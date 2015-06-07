# Build:
# docker build -t zokeber/icecast-kh-example:latest .
#
# Create:
# docker create -it -m="512m" -p 0.0.0.0:8000:8000 --name container-icecast-kh -h container-icecast-kh zokeber/icecast-kh-example
#
# Start:
# docker start container-icecast-kh
#
# Connect with bash:
# docker exec -it container-icecast-kh bash
#
# Connect URL:
# http://127.0.0.1:8000/


# Pull base image
FROM zokeber/icecast-kh

# Maintener
MAINTAINER Daniel Lopez Monagas <zokeber@gmail.com>

# Change localtime
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime

# Create user and change owner directories
RUN adduser icecast
RUN mkdir -p /var/log/icecast
RUN chown -R icecast:icecast /var/log/icecast
RUN chmod -R 777 /var/log/icecast

# Copy config file and change owner
ADD etc/icecast/audiostreaming.xml /home/icecast/audiostreaming.xml
RUN chown icecast:icecast /home/icecast/audiostreaming.xml

# Mountable directories
VOLUME ["/var/log/icecast", "/home/icecast"]

# User
USER icecast

# Set the environment variables
ENV HOME /home/icecast

# Working directory
WORKDIR /home/icecast

# Endpoint
ENTRYPOINT ["/usr/bin/icecast"]
CMD ["-c", "/home/icecast/audiostreaming.xml"]

# Expose ports.
EXPOSE 8000
