#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.1"
LABEL description="AOSP build docker on myhome - cache optimized"

# add package
ARG USERNAME
USER root

# Combined update and install for Android build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 \
    x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc \
    unzip fontconfig devscripts equivs config-package-dev debhelper-compat \
    golang lsof && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo && \
    install -m 755 ./repo /usr/local/bin && rm -rf ./repo

WORKDIR /opt/
RUN git clone https://github.com/google/android-cuttlefish && \
    cd android-cuttlefish && tools/buildutils/build_packages.sh

RUN groupadd -g 994 kvm && groupadd -g 993 render

RUN cd android-cuttlefish && apt-get install -f -y ./cuttlefish-base_*_*64.deb && \
    apt-get install -f -y ./cuttlefish-user_*_*64.deb && \
    apt-get install -f -y ./cuttlefish-common_*_*64.deb

RUN usermod -aG kvm,cvdnetwork,render ${USERNAME}
RUN ln -sf /usr/bin/python3 /usr/bin/python

USER ${USERNAME}
WORKDIR /home/${USERNAME}