#!/bin/bash
#
# Build and install prerequisites for compiling lmserver dependencies
#
. /opt/rocks/share/devel/src/roll/etc/bootstrap-functions.sh

# enable elgis repo, need for map server
(cd src/RPMS; 
ELGISREPO=elgis-release-6-6_0.noarch.rpm
wget  http://elgis.argeo.org/repos/6/$ELGISREPO
rpm -i $ELGISREPO
)

# enable repo for postgresql and postgis2 rpms
(cd src/RPMS; 
PGDGREPO=pgdg-centos91-9.1-4.noarch.rpm
wget http://yum.postgresql.org/9.1/redhat/rhel-6-x86_64/$PGDGREPO
rpm -i $PGDGREPO
)

#do this only once for roll distro to keep known RPMS in the roll src
#(cd src/RPMS; 
#wget ftp://ftp.pbone.net/mirror/atrpms.net/el6-x86_64/atrpms/stable/bitstream-vera-sans-fonts-1.10-18.el6.noarch.rpm; \
#wget ftp://ftp.pbone.net/mirror/atrpms.net/el6-i386/atrpms/stable/bitstream-vera-fonts-common-1.10-18.el6.noarch.rpm; \
#yumdownloader --resolve --enablerepo elgis mapserver.x86_64; \
#yumdownloader --resolve --enablerepo epel fribidi.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91-devel.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91-server.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91-docs.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91-python.x86_64; \
#yumdownloader --resolve --enablerepo base uuid.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91-contrib.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgresql91-test.x86_64; \
#yumdownloader --enablerepo pgdg91 pgbouncer.x86_64; \
#yumdownloader --resolve --enablerepo epel json-c.x86_64; \
#yumdownloader --resolve --enablerepo pgdg91 postgis2_91.x86_64; \
#yumdownloader --resolve --enablerepo rpmforge hdf4.x86_64 hdf4-devel.x86_64; \
#yumdownloader --resolve --enablerepo rpmforge hdf5.x86_64 hdf5-devel.x86_64; \
#yumdownloader --resolve --enablerepo base readline-devel.x86_64; \
#yumdownloader --resolve --enablerepo base giflib-devel.x86_64; \
#yumdownloader --resolve --enablerepo base byacc.x86_64; \
#yumdownloader --resolve --enablerepo base neon.x86_64 pakchois.x86_64 subversion.x86_64; \
#yumdownloader --resolve --enablerepo base cmake.x86_64; \
#yumdownloader --resolve --enablerepo base screen.x86_64; \
#)

# add dynamic libs
echo "/usr/java/latest/jre/lib/amd64" > /etc/ld.so.conf.d/lifemapper-server.conf
echo "/usr/java/latest/jre/lib/amd64/server" >> /etc/ld.so.conf.d/lifemapper-server.conf
echo "/opt/lifemapper/lib" >> /etc/ld.so.conf.d/lifemapper-server.conf
echo "/opt/python/lib/" >> /etc/ld.so.conf.d/lifemapper-server.conf
echo "/opt/rocks/fcgi/lib" >> /etc/ld.so.conf.d/lifemapper-server.conf
/sbin/ldconfig

# for compiling 
yum --enablerepo base install cmake

# for checking out lifemapper source  
yum --enablerepo base install subversion

# for mapserver
rpm -i src/RPMS/bitstream-vera-fonts-common-1.10-18.el6.noarch.rpm
rpm -i src/RPMS/bitstream-vera-sans-fonts-1.10-18.el6.noarch.rpm


# for mysql-python, rtree, pylucene
compile setuptools
install opt-lifemapper-setuptools

# for PyLucene 
compile ant
install lifemapper-ant
export ANT_HOME=/opt/lifemapper
(cd src/pylucene;  make install_jcc)

# for pytables 
compile cython 
install opt-lifemapper-cython 
compile numexpr 
install opt-lifemapper-numexpr 
yum --enablerepo rpmforge install hdf5 hdf5-devel

# meed for gdal
compile geos
install lifemapper-geos
/sbin/ldconfig

# meed for psycopg2
compile gdal
install lifemapper-gdal
/sbin/ldconfig

# for rtree
compile spatialindex
install lifemapper-spatialindex
/sbin/ldconfig

# install postgresql
yum --enablerepo base update openssl
yum install postgresql91
yum install postgresql91-devel

echo "You will need to checkout src from Lifemapper SVN:"
echo "    cd src/lmserver"
echo "    make prep "
echo "and download data from Lifemapper:"
echo "    cd src/lmdata-climate"
echo "    make prep "
echo "    make install "
echo "    cd src/lmdata-species"
echo "    make prep "

