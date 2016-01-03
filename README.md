# StreamMachine Dockerfile Example

This repository contains a Dockerfile example to build a Docker Image with StreamMachine

## Base Docker Image

* [zokeber/icecast-kh](https://registry.hub.docker.com/u/zokeber/icecast-kh/)

## Usage

### Build

To create the image mediainbox/StreamMachine, clone this repository and execute the following command on the docker-icecast-kh-example folder:

`docker build -t mediainbox/StreamMachine:latest .`

Another alternatively, you can build an image directly from Github:

`docker build -t="mediainbox/StreamMachine:latest" github.com/mediainbox/docker-streammachine`


### Create and running a container

**Create container:**

```
docker create -it -m="512m" -p 0.0.0.0:8000:8000-8020:8020 --name StreamMachine-master -h StreamMachine-master mediainbox/StreamMachine:latest
```

**Start container:**

```
docker start StreamMachine-master
```


### Connection methods:

**Bash:**

`docker exec -it StreamMachine-master bash`

**Url to StreamMachine API**

`http://DOCKER-IP:8010`
