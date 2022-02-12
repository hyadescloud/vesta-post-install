#!/bin/sh
source ../common/functions.sh;

# Install PHP versions
php_versions=("5.6" "7.0" "7.1" "7.2" "7.3" "7.4" "8.0" "8.1");


for version in ${php_versions[@]}
do
  php_fpm_install $version
done