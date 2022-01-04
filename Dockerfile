#version 0.4.1
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
RUN apt-get purge -y postgres*
#RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ zesty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN apt-get update && apt-get install -y libpq-dev
# postgresql postgresql-contrib
RUN npm install -g pm2
RUN useradd adamant -s /bin/bash -m
RUN echo "adamant:password" | chpasswd
RUN echo "%adamant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER adamant
WORKDIR /home/adamant
ADD https://api.github.com/repos/Adamant-im/adamant/git/commits/1c3bae29b6c9bb983d78a01e8725c5bb81ce9fb9 version.json
RUN git clone https://github.com/Adamant-im/adamant
WORKDIR adamant
RUN npm install


EXPOSE 36666
COPY starter.sh /home/adamant/adamant
COPY genesisBlock.json genesisBlock.json
CMD ["/bin/bash", "./starter.sh"]


#node app.js



