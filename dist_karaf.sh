#!/bin/bash

set -e
set -u

### Options ###
name=karaf
version=4.1.0
package_version="-1"
description="Apache Karaf is a modern and polymorphic container."
javajdk="oracle-java8-jdk" # or openjdk-8-jdk
url="https://karaf.apache.org/"
arch="all"
section="misc"
license="Apache Software License 2.0"
bin_package="apache-karaf-${version}.tar.gz"
bin_download_url="http://apache.belnet.be/karaf/${version}/${bin_package}"
origdir="$(pwd)"
###############




#_ MAIN _#
rm -rf ${name}*.deb
if [[ ! -f "${bin_package}" ]]; then
  wget -c ${bin_download_url}
fi
mkdir -p tmp && pushd tmp
rm -rf karaf
mkdir -p karaf
cd karaf
mkdir -p build/usr/local/karaf
mkdir -p build/lib/systemd/system
mkdir -p build/etc/karaf
mkdir -p build/var/lib/karaf/data
mkdir -p build/var/log/karaf


# Updated to use the Binary package

tar zxf ${origdir}/${bin_package}
cd apache-karaf-${version}

# Config files
mv etc/* ../build/etc/karaf
cp ${origdir}/files/config/etc/karaf.conf ../build/etc/karaf
cp ${origdir}/files/config/lib/systemd/system/karaf.service ../build/lib/systemd/system
cp ${origdir}/files/config/lib/systemd/system/karaf@.service ../build/lib/systemd/system
cp ${origdir}/files/config/etc/org.ops4j.pax.logging.cfg ../build/etc/karaf
cp ${origdir}/files/config/etc/org.ops4j.pax.url.mvn.cfg ../build/etc/karaf
cp ${origdir}/files/config/etc/shell.init.script ../build/etc/karaf
mv * ../build/usr/local/karaf/
rmdir ../build/usr/local/karaf/etc

cd ../build
pushd usr/local/karaf
popd

### Build
fpm -t deb \
    -n ${name} \
    -v ${version}${package_version} \
    --description "${description}" \
    --url="{$url}" \
    -a ${arch} \
    --category ${section} \
    --vendor "" \
    --license "${license}" \
    --config-files etc/karaf \
    -m "karaf@localhost" \
    --prefix=/ \
    -d ${javajdk} \
    --after-install ${origdir}/files/build/postinst \
    --before-remove ${origdir}/files/build/prerm \
    --after-remove ${origdir}/files/build/postrm \
    -s dir \
    -- .
mv karaf*.deb ${origdir}/package
popd

rm -r ${origdir}/tmp
rm -r ${origdir}/${bin_package}
