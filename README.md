# Icecast-kh Dockerfile Example

This repository contains a Dockerfile example to build a Docker Image with Icecast-kh version 2.4.0

## Base Docker Image

* [zokeber/icecast-kh](https://registry.hub.docker.com/u/zokeber/icecast-kh/)

## Usage

### Build

To create the image zokeber/icecast-kh-example, clone this repository and execute the following command on the docker-icecast-kh-example folder:

`docker build -t zokeber/icecast-kh-example:latest .`

Another alternatively, you can build an image directly from Github:

`docker build -t="zokeber/icecast-kh:latest" github.com/zokeber/docker-icecast-kh-example`


### Create and running a container

**Create container:**

```
docker create -it --name container-icecast-kh -h container-icecast-kh zokeber/icecast-kh-example
```

**Start container:**

```
docker start container-icecast-kh
```


### Connection methods:

**Bash:**

`docker exec -it container-icecast-kh bash`

**Url to icecast webadmin**

`http://127.0.0.1:8000`

