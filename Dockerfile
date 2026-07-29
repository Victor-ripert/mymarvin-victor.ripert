FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    make \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt-get/lists/*

USER jenkins

RUN jenkins-plugin-cli --plugins \
    configuration-as-code \
    job-dsl \
    git \
    github \
    github-api \
    role-strategy \
    git-client \
    ws-cleanup