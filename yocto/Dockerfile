#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.1"
LABEL description="yocto build env - cache optimized"

# add package
ARG USERNAME
USER root

# Combined update and install for better caching
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio \
    python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping \
    python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1 \
    gcc-multilib libsdl1.2-dev docbook-utils fop dblatex xmlto libxml-simple-perl \
    libncurses5-dev lib32z1 flex bison bc rsync libssl-dev autoconf kmod \
    xterm gettext xsltproc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo && \
    install ./repo /usr/local/bin && rm -rf ./repo

RUN ln -sf /usr/bin/python3 /usr/bin/python

USER ${USERNAME}
WORKDIR /home/${USERNAME}