#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="nodejs docker on myhome"

# add package
ARG USERNAME
USER root

# install newest repo
RUN apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo && install ./repo /usr/local/bin && rm -rf ./repo

RUN ln -s /usr/bin/python3 /usr/bin/python

USER ${USERNAME}
WORKDIR /home/${USERNAME}
