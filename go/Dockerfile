#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="Go development environment on myhome"

# add package
ARG USERNAME
USER root

ENV GO_VERSION=1.23.6
RUN wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

# Add go bin to global path for all users
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/bash.bashrc

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# Set GOPATH and update PATH for the user
ENV GOPATH=/home/${USERNAME}/go
ENV PATH=$PATH:/usr/local/go/bin:/home/${USERNAME}/go/bin
