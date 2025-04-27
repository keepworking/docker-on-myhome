#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="AOSP build docker on myhome"

# add package
ARG USERNAME
USER root

# install newest repo
# for over Android 9.0
RUN apt install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo && install -m 755 ./repo /usr/local/bin && rm -rf ./repo

RUN ln -s /usr/bin/python3 /usr/bin/python

USER ${USERNAME}
WORKDIR /home/${USERNAME}
