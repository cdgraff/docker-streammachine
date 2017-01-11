# Build:
# docker build --rm -t mediainbox/streammachine:master .
#
# Create:
# docker create -it -m="512m" -p 8000-8020:8000-8020 --name StreamMachine-master -h StreamMachine-master mediainbox/streammachine:master
#
# Start:
# docker start StreamMachine-master
#
# Connect with bash:
# docker logs StreamMachine-master
#
# Connect URL:
# http://127.0.0.1:8020/

# Jinja2 Template idea from: https://tryolabs.com/blog/2015/03/26/configurable-docker-containers-for-multiple-environments/

FROM mediainbox/base

# Maintener
MAINTAINER Alejandro Ferrari <aferrari@mediainbox.net>

# Change localtime
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    py-setuptools \
    build-base \
    tar \
    bzip2 \
    nasm \
    git \
    bash
RUN pip install j2cli

WORKDIR /srv
RUN git clone https://github.com/mediainbox/StreamMachine.git
RUN cd StreamMachine && npm install
COPY master.json.j2 /config/
COPY docker-entrypoint.sh /

VOLUME "/config"

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["StreamMachine/streammachine-cmd", "--config", "/config/master.json"]
