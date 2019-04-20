# Jenkins JNLP Slave 

[![Docker Stars](https://img.shields.io/docker/stars/rogaha/jnlp-slave-docker.svg)](https://hub.docker.com/r/rogaha/jnlp-slave-docker/)
[![Docker Pulls](https://img.shields.io/docker/pulls/rogaha/jnlp-slave-docker.svg)](https://hub.docker.com/r/rogaha/jnlp-slave-docker/)
[![Docker Automated build](https://img.shields.io/docker/automated/joao29a/jnlp-slave-alpine-docker.svg)](https://hub.docker.com/r/rogaha/jnlp-slave-docker/)

This image is based on [jenkins/jnlp-slave](https://hub.docker.com/r/jenkins/jnlp-slave/) running alpine with docker binaries.

## Usage

To run a Docker container and be allowed to use docker binaries, you have to bind mount the host's sock to the container:

```sh
docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    rogaha/jnlp-slave-docker -url http://jenkins-server:port <secret> <agent name>
```
If you don't have enough permission, run:

```sh
docker run \
    -u root \
    -v /var/run/docker.sock:/var/run/docker.sock \
    rogaha/jnlp-slave-docker -url http://jenkins-server:port <secret> <agent name>
```

For a more detailed documentation, access [jenkins/jnlp-slave](https://hub.docker.com/r/jenkins/jnlp-slave/)
