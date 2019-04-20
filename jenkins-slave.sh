#!/bin/bash

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
REGULAR_USER=jenkins

if [ -S ${DOCKER_SOCKET} ]; then
   # recreating group docker
   delgroup $DOCKER_GROUP
   delgroup ping || true
   GROUP_ID=$(stat -c '%g' /var/run/docker.sock)
   addgroup -g $GROUP_ID $DOCKER_GROUP
   adduser $REGULAR_USER $DOCKER_GROUP
fi

CMD="$@"

su $REGULAR_USER -c "exec jenkins-slave ${CMD}"
