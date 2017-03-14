FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    devscripts \
    equivs \
    git-buildpackage \
    git \
    lsb-release \
    make \
    openssh-client \
    pristine-tar \
    rake \
    rsync \
    ruby \
    ruby-dev \
    rubygems \
    wget

RUN echo "gem: --no-ri --no-rdoc" >/etc/gemrc
RUN gem install fpm

RUN apt-get update && apt-get install -y \
    wget unzip curl netcat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "deb http://debian.lampiris.be/debian/ jessie main non-free contrib" >> /etc/apt/sources.list && \
    echo "deb http://debian.lampiris.be/repos/apt/debian jessie lampiris" >> /etc/apt/sources.list && \
    wget -O - http://debian.lampiris.be/lampirisdeb.pub | apt-key add - && \
    apt-get update && apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    oracle-java8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
