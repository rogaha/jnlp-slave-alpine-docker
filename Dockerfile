FROM jenkins/jnlp-slave:alpine

# add docker
USER root
RUN apk add docker

# add script
ADD jenkins-slave.sh /

ENTRYPOINT ["/jenkins-slave.sh"]
