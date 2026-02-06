#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.1"
LABEL description="con urllib3 docker on myhome - cache optimized"

# add package
ARG USERNAME
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsqlite3-0 libssl-dev zlib1g-dev libbz2-dev libreadline-dev libffi-dev \
    libncursesw5-dev libgdbm-dev libgdbm-compat-dev libnsl-dev xz-utils tk-dev \
    uuid-dev liblzma-dev libsqlite3-dev libxml2-dev libxmlsec1-dev libexpat1-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# python3.12 installation remains as is since it's a specific requirement
RUN PY_VER="3.12.12" && wget https://www.python.org/ftp/python/$PY_VER/Python-$PY_VER.tgz && \
    tar -xzf Python-$PY_VER.tgz && \
    cd Python-$PY_VER && \
    ./configure --enable-optimizations --with-lto --without-tests --disable-test-modules && \
    make -j"$(nproc)" && make install && \
    cd .. && rm -rf Python-$PY_VER Python-$PY_VER.tgz

RUN python3 -m pip install --upgrade pip nox uv pytest || python3 -m pip install --upgrade pip nox uv pytest --break-system-packages

RUN python3.12 -m ensurepip && \
    python3.12 -m pip install --upgrade pip nox coverage pytest

USER ${USERNAME}
WORKDIR /home/${USERNAME}