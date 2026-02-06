#syntax=docker/dockerfile:1.2
ARG UBT_VER
FROM ubuntu:${UBT_VER:-22.04}

# docker file info
LABEL author="keepworking"
LABEL version="2.2"
LABEL description="lightweight dev base with gemini - single layer optimized"

# args
ARG USERNAME
ARG USERUID
ARG USERGID

# switch to root
USER root

RUN echo $USERNAME
# make user
RUN groupadd -g ${USERGID} ${USERNAME} && \
    useradd -u ${USERUID} -g ${USERGID} --create-home --shell /bin/bash --groups sudo ${USERNAME}
RUN echo "${USERNAME}:1234" | chpasswd

# Install Default Packages
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS="yes"

# Combined update and install - Runs apt-get update ONLY ONCE
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    git-core \
    vim \
    curl \
    wget \
    tree \
    locales \
    sudo \
    bash-completion \
    openssh-server \
    tig \
    tmux \
    unzip \
    iputils-ping \
    python3 \
    python3-pip \
    build-essential \
    cmake \
    rsync \
    bc \
    libssl-dev \
    ca-certificates \
    gnupg \
    htop \
    ncdu \
    net-tools \
    libncurses5-dev \
    xz-utils \
    strace \
    valgrind \
    clangd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Append lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"`]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    install lazygit /usr/local/bin && \
    rm -rf lazygit_* lazygit

# Set Timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# add locales
RUN localedef -i en_US -c -f UTF-8 en_US.UTF-8
RUN localedef -i ko_KR -c -f UTF-8 ko_KR.UTF-8

ENV LANG=en_US.UTF-8
ENV TERM=xterm-256color

# pyright for vim (apt update no longer needed here)
RUN pip install pyright || pip install --break-system-packages pyright

# Vim Config
COPY vimrc.append /vimrc.append
RUN mkdir -p /etc/vim/autoload
RUN curl -fLo /etc/vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN cat /vimrc.append >> /etc/vim/vimrc && rm /vimrc.append
RUN vim -c 'PlugInstall | qa'

# --- Gemini CLI (Common) ---
ARG NODE_VERSION=v24.13.0
ARG NODE_DIST=linux-x64
ARG NODE_URL=https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${NODE_DIST}.tar.xz

RUN curl -fsSL ${NODE_URL} -o node.tar.xz && \
    tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
    rm node.tar.xz

RUN npm install -g @google/gemini-cli@latest

# switch to user
USER ${USERNAME}
WORKDIR /home/${USERNAME}
