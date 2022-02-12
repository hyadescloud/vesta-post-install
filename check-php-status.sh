#!/bin/sh

source common/functions.sh;

# Declare each php versions
declare -A php_versions;
    
# List of each version of php
php_versions[56]=5.6
php_versions[70]=7.0
php_versions[71]=7.1
php_versions[72]=7.2
php_versions[73]=7.3
php_versions[74]=7.4
php_versions[80]=8.0
php_versions[81]=8.1

    
for phpv in "${php_versions[@]}"
do
    check_php_status $phpv
done
