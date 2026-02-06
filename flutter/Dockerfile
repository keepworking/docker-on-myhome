#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base22.04

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="flutter docker on myhome"

# add package
ARG USERNAME
USER root

# Install dependencies for Flutter
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip libglu1-mesa \
    clang cmake ninja-build pkg-config libgtk-3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter
ENV FLUTTER_HOME=/usr/local/flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

# Configure Flutter
RUN git config --global --add safe.directory $FLUTTER_HOME
RUN flutter config --no-analytics
RUN flutter precache

# Ensure the user has permissions for the Flutter directory
RUN chown -R ${USERNAME}:${USERNAME} $FLUTTER_HOME

USER ${USERNAME}
WORKDIR /home/${USERNAME}
