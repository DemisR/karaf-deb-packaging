FROM openjdk:8

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

ADD files /build/files
ADD build_karaf_package.sh /build/build_karaf_package.sh

WORKDIR /build
ENTRYPOINT ["/build/build_karaf_package.sh"]
