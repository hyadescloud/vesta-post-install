#!/bin/sh

DOWNLOAD_DIR=~/downloads
TARGET_DIR=/usr/share/phpmyadmin-latest

mkdir $DOWNLOAD_DIR

wget -P $DOWNLOAD_DIR https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
wget -P $DOWNLOAD_DIR https://files.phpmyadmin.net/phpmyadmin.keyring

cd $DOWNLOAD_DIR
gpg --import phpmyadmin.keyring
wget -P $DOWNLOAD_DIR https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz.asc
gpg --verify phpMyAdmin-latest-all-languages.tar.gz.asc

mkdir -p $TARGET_DIR

cd $DOWNLOAD_DIR
tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C $TARGET_DIR

cp $TARGET_DIR/config.sample.inc.php $TARGET_DIR/config.inc.php
nano $TARGET_DIR/config.inc.php

chown -R root:root $TARGET_DIR
chmod 664 $TARGET_DIR/config.inc.php


systemctl restart apache2