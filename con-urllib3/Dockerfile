#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="con urllib3 docker on myhome"

# add package
ARG USERNAME
USER root

# referenced https://urllib3.readthedocs.io/en/stable/contributing.html
#https://www.python.org/ftp/python/3.12.12/Python-3.12.12.tgz


RUN apt-get install -y libsqlite3-0 libssl-dev   zlib1g-dev   libbz2-dev   libreadline-dev   libffi-dev   libncursesw5-dev   libgdbm-dev libgdbm-compat-dev   libnsl-dev   xz-utils   tk-dev   uuid-dev   liblzma-dev   libsqlite3-dev   libxml2-dev libxmlsec1-dev   libexpat1-dev

# python3.12 for run warn_executed.py (see https://github.com/urllib3/urllib3/issues/3661 )
RUN PY_VER="3.12.12" && wget https://www.python.org/ftp/python/$PY_VER/Python-$PY_VER.tgz && \
    tar -xzf Python-$PY_VER.tgz && \
    cd Python-$PY_VER && \
    ./configure --enable-optimizations --with-lto --without-tests --disable-test-modules && \
    make -j"$(nproc)" && make install

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade nox
RUN python3 -m pip install --upgrade uv
RUN python3 -m pip install --upgrade pytest

RUN python3.12 -m ensurepip && python3.12 -m pip install --upgrade pip
RUN python3.12 -m pip install --upgrade nox
RUN python3.12 -m pip install --upgrade coverage
RUN python3.12 -m pip install --upgrade pytest

USER ${USERNAME}
WORKDIR /home/${USERNAME}
