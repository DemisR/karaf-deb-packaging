karaf-deb-packaging
===================

Simple debian packaging for Apache Karaf

Branchs/Versions:
- wheezy (Java: oracle-java8-jdk)
- jessie (Java: oracle-java8-jdk)
- openjdk8-jessie (Java: openjdk-8-jdk)

# Build debian package  with docker

```
docker build -t karafbuilder .
docker run --name karaf_build_$(date "+%s") -v $(pwd)/package:/build/package  karafbuilder
```

Debian package is build and moved in `package` folder.

## Tested Platforms

* Debian Jessie ( jessie and master branch )
* Debian Wheezy ( wheezy branch )

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
