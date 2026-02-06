#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.1"
LABEL description="optee docker on myhome - cache optimized"

ARG DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1

# add package
ARG USERNAME
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    adb acpica-tools autoconf automake bc bison build-essential ccache cpio \
    cscope curl device-tree-compiler e2tools expect fastboot flex ftp-upload \
    gdisk git libattr1-dev libcap-ng-dev libfdt-dev libftdi-dev libglib2.0-dev \
    libgmp3-dev libhidapi-dev libmpc-dev libncurses5-dev libpixman-1-dev \
    libslirp-dev libssl-dev libtool libusb-1.0-0-dev make mtools netcat \
    ninja-build python3-cryptography python3-pip python3-pyelftools \
    python3-serial python3-tomli python-is-python3 rsync swig unzip uuid-dev \
    wget xdg-utils xsltproc xterm xz-utils zlib1g-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install repo
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo && \
    install ./repo /usr/local/bin && rm -rf ./repo

USER ${USERNAME}
WORKDIR /home/${USERNAME}