karaf-deb-packaging
===================

Simple debian packaging for Apache Karaf with systemd

### Changelog


# Pre-requisites - Install fpm

```sh
$ sudo apt-get update
$ sudo apt-get install ruby ruby-dev build-essential
$ sudo gem install fpm
```
# Options

You can change the karaf `version` and `javajdk` in `dist_karaf.sh`.


# Usage

```sh
$ ./dist_karaf.sh
```

# Installation

```sh
$ dpkg -i karaf_4.1.0-1_all.deb
```

or if you have your own repo:

```sh
$ ~/gpg-agent-headless.sh
$ reprepro -b /var/repositories/ includedeb trusty $@
$ apt-get install karaf
```
Note: Installs and runs as user `karaf`. Easy to change for your needs.

## Post install

To flag the application to start automatically on system boot use the following command:
```
systemctl enable karaf.service
```

### Connect to instance

```sh
ssh -p 8101 karaf@localhost
```

## Tested Platforms

* Debian Jessie

---

## Package info
Debian pkg: `karaf_4.1.0-1_all.deb`
Version :
  - karaf 4.1.0

Service file:
  - /lib/systemd/system/karaf.service

Configuration:
  - /etc/karaf

Logs:
  - /usr/local/karaf/data/log/
  - /var/log/karaf/

Binaries:
  - /usr/local/karaf/bin/

Data:
  - /var/lib/karaf/data

Network ports:
  - karaf shell: 8101

Users:
  - karaf : karaf

---

### Install jolokia: (in karaf shell)

feature:install jolokia

Default config http://hostname:8181/jolokia  karaf/karaf

## Build debian package with docker-compose

```
docker-compose build
docker-compose up
```
