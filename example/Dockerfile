
#syntax=docker/dockerfile:1.2
ARG USERNAME
FROM ${USERNAME}-base

# docker file info
LABEL author="keepworking"
LABEL version="1.0"
LABEL description="nodejs docker on myhome"

# add package
ARG USERNAME
USER root

RUN curl -fsSL https://fnm.vercel.app/install | /bin/bash -s -- -s -d /usr/bin/
RUN chmod a+x /usr/bin/fnm

RUN echo 'eval "`fnm env`"' >> /etc/bash.bashrc
RUN eval "$(fnm env)" && fnm use --install-if-missing 20

USER ${USERNAME}
WORKDIR /home/${USERNAME}
