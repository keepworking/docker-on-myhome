#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="nodejs docker on myhome"

# add package
ARG USERNAME
USER root

# nothing

USER ${USERNAME}
WORKDIR /home/${USERNAME}
