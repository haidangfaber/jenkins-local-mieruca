FROM jenkins/jenkins:lts

USER root

# Cài Maven + Docker CLI
RUN apt-get update && \
    apt-get install -y maven docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins