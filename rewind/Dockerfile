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


FROM cdgraff/ffmpeg

# Change localtime
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Create base directories
RUN mkdir -p /var/log/StreamMachine

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl software-properties-common git wget
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:andrewrk/libgroove
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs libgroove-dev\
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

#Download and Install WaveForm
RUN cd /srv; git clone https://github.com/StreamMachine/sm-waveform.git
RUN cd /srv/sm-waveform; npm install

#Download and Install Archive
RUN cd /srv; git clone https://github.com/StreamMachine/sm-archiver.git
RUN cd /srv/sm-archiver; npm install

# Install PM2 to manage process
RUN npm install -g pm2

# Working directory
WORKDIR /srv/StreamMachine

# Expose ports.
EXPOSE 3000 8000 9000
