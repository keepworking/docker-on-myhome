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
RUN apt install -y git devscripts equivs config-package-dev debhelper-compat golang curl

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo && install -m 755 ./repo /usr/local/bin && rm -rf ./repo

WORKDIR /opt/
RUN git clone https://github.com/google/android-cuttlefish 
RUN cd android-cuttlefish && tools/buildutils/build_packages.sh

RUN groupadd -g 994 kvm
RUN groupadd -g 993 render

RUN apt install -y lsof

RUN cd android-cuttlefish && apt-get install -f -y ./cuttlefish-base_*_*64.deb
RUN cd android-cuttlefish && apt-get install -f -y ./cuttlefish-user_*_*64.deb
RUN cd android-cuttlefish && apt-get install -f -y ./cuttlefish-common_*_*64.deb

RUN usermod -aG kvm,cvdnetwork,render ${USERNAME}

RUN ln -s /usr/bin/python3 /usr/bin/python

USER ${USERNAME}
WORKDIR /home/${USERNAME}
