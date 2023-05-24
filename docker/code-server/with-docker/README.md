# code-server-with-docker

This is a CodeServer container with Docker-in-Docker 

## Usage

Start the stack:

```bash
docker-compose up -d
```

Get the docker binary:

```bash
curl -Ls https://download.docker.com/linux/static/stable/x86_64/docker-20.10.24.tgz | tar -xz
sudo mv docker/docker /usr/bin/docker
rm -rf docker
```

At the moment our docker host is set to: 

```bash
env | grep DOCKER_HOST
DOCKER_HOST=tcp://docker:2376
```

And we can test that with:

```bash
docker ps
docker pull nginx
```
