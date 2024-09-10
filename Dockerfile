
#syntax=docker/dockerfile:1.2
FROM ubuntu:22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="docker on my home base"

# args
ARG USERNAME
ARG USERUID
ARG USERGID

# switch to root
USER root 

RUN echo $USERNAME
RUN groupadd -g ${USERGID} ${USERNAME}
RUN useradd -u ${USERUID} -g ${USERGID} --create-home --shell /bin/bash --groups sudo ${USERNAME}
RUN echo "${USERNAME}:1234" | chpasswd
RUN chage -d 0 ${USERNAME}

# Install Default Packages
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS="yes"

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list ; \
    sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list ; \
    apt-get update

    RUN apt-get install -y apt-utils \
    gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio \
    python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping \
    libsdl1.2-dev xterm make xsltproc docbook-utils fop dblatex xmlto gettext \
    libxml-simple-perl vim libncurses5-dev flex bison gnupg bc rsync libssl-dev \
    lib32z1 autoconf tig tmux kmod openssh-server curl tree locales sudo

# Set Timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# add locales
RUN localedef -i en_US -c -f UTF-8 en_US.UTF-8
RUN localedef -i ko_KR -c -f UTF-8 ko_KR.UTF-8

ENV LANG=en_US.UTF-8
ENV TERM=xterm-256color

# switch to user

USER ${USERNAME}
WORKDIR /home/${USERNAME}
