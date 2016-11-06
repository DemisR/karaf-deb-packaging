karaf-deb-packaging
===================

Simple debian packaging for Apache Karaf

### Changelog


# Pre-requisites - Install fpm

```sh
$ sudo apt-get update
$ sudo apt-get install ruby ruby-dev build-essential
$ sudo gem install fpm
```
# Options

You can change the karaf version in dist_karaf on new versions of both.

# Usage

```sh
$ ./dist_karaf.sh
```

# Installation

```sh
$ dpkg -i karaf_4.0.3-1_all.deb
```

or if you have your own repo:

```sh
$ ~/gpg-agent-headless.sh
$ reprepro -b /var/repositories/ includedeb trusty $@
$ apt-get install karaf
```
Note: Installs and runs as user 'karaf'. Easy to change for your needs.

## Post install

```sh

$ sudo update-rc.d karaf defaults 25

 Adding system startup for /etc/init.d/karaf ...
   /etc/rc0.d/K25karaf -> ../init.d/karaf
   /etc/rc1.d/K25karaf -> ../init.d/karaf
   /etc/rc6.d/K25karaf -> ../init.d/karaf
   /etc/rc2.d/S25karaf -> ../init.d/karaf
   /etc/rc3.d/S25karaf -> ../init.d/karaf
   /etc/rc4.d/S25karaf -> ../init.d/karaf
   /etc/rc5.d/S25karaf -> ../init.d/karaf
```

### Connect to instance
```sh
ssh -p 8101 karaf@localhost
```

## Tested Platforms

* Debian Wheezy

---

## Package info
Debian pkg: `karaf_4.0.3-1_all.deb`
Version :
  - karaf 4.0.3

Init scripts:
  - /etc/init.d/karaf

Configuration:
  - /etc/karaf
  - /etc/default/karaf

Logs:
  - /usr/local/karaf/data/log/
  - /var/log/karaf/

Binaries:
  - /usr/local/karaf/bin/

Data:
  - /usr/local/karaf/data

Network ports:
  - karaf shell: 8101

Users:
  - karaf : karaf

---

### Install jolokia: (in karaf shell)

feature:install jolokia

Default config http://hostname:8181/jolokia  karaf/karaf
