# Standard build
## Pre-requisites - Install fpm

```sh
$ sudo apt-get update
$ sudo apt-get install ruby ruby-dev build-essential
$ sudo gem install fpm
```
## Options

You can change the karaf `version` and `javajdk` in `build_karaf_package.sh`.


## Usage

```sh
$ ./build_karaf_package.sh
```

## Installation

```sh
$ apt-get install oracle-java8-jdk # or openjdk-8-jdk
$ dpkg -i karaf_4.1.0-1_all.deb
```

or if you have your own repo:

```sh
$ apt-get install karaf
```
Note: Installs and runs as user `karaf`. Easy to change for your needs.

# Post install

To flag the application to start automatically on system boot use the following command:
```
systemctl enable karaf.service
```

### Connect to instance

```sh
ssh -p 8101 karaf@localhost
```
