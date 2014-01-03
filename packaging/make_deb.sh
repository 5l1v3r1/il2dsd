#!/bin/bash

WORK_DIR='../dist/'
TARGET_DIR=$WORK_DIR'debian/'
DEB_NAME='il2dsd_1.0-1_all.deb'


echo 'Creating directory structure...'

mkdir -p $TARGET_DIR'etc/'
mkdir -p $TARGET_DIR'etc/init.d/'
mkdir -p $TARGET_DIR'usr/bin/'


echo 'Copying daemon files...'

cp ../scripts/il2dsd $TARGET_DIR'etc/init.d/'
cp ../scripts/il2ds-install $TARGET_DIR'usr/bin/'
cp ../templates/il2dsd.conf $TARGET_DIR'etc/'


echo 'Preparing package...'

mkdir -p $TARGET_DIR'DEBIAN/'
mkdir -p $TARGET_DIR'usr/share/doc/il2dsd'
mkdir -p $TARGET_DIR'usr/share/man/man8'

cp ./debian/conffiles $TARGET_DIR'DEBIAN/'
cp ./debian/control $TARGET_DIR'DEBIAN/'
cp ./debian/copyright $TARGET_DIR'usr/share/doc/il2dsd/'

cp ./debian/changelog $TARGET_DIR'usr/share/doc/il2dsd/changelog'
cp ./debian/changelog $TARGET_DIR'usr/share/doc/il2dsd/changelog.Debian'
gzip -f --best $TARGET_DIR'usr/share/doc/il2dsd/changelog'
gzip -f --best $TARGET_DIR'usr/share/doc/il2dsd/changelog.Debian'

cp ../doc/man/man8/il2ds-install.8 $TARGET_DIR'usr/share/man/man8'
gzip -f --best $TARGET_DIR'usr/share/man/man8/il2ds-install.8'


echo 'Building package...'

cd $WORK_DIR
fakeroot dpkg-deb --build debian
mv debian.deb $DEB_NAME
cd - > /dev/null


echo 'Done: '$WORK_DIR$DEB_NAME
