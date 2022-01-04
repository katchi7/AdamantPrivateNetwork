FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y git bash locales
RUN apt-get install -y mc git curl python build-essential curl automake autoconf libtool redis-server wget autotools-dev libsodium-dev

#setting up locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g adamant-console@1.4.5
RUN useradd adamant -s /bin/bash -m
RUN echo "adamant:password" | chpasswd
RUN echo "%adamant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER adamant
WORKDIR /home/adamant
RUN mkdir ~/.adm
COPY ./config.json ~/.adm/config.json
CMD ["/bin/bash", "adm"]
