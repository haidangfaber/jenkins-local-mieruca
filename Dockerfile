FROM jenkins/jenkins:lts

USER root

ARG DOCKER_GID=1001

RUN apt-get update && \
    apt-get install -y maven docker.io && \
    groupadd -g ${DOCKER_GID} docker-host && \
    usermod -aG docker-host jenkins && \
    rm -rf /var/lib/apt/lists/*

USER jenkins