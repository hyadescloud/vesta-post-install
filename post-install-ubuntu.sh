#!/bin/sh

source common/functions.sh;


echo "Updating system"
apt-get update -y 
apt-get upgrade -y

echo "Installing necessary packages"
apt-get install -y git zip apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

apt-get update
a2enmod proxy_fcgi setenvif

echo "Installing necessary packages"
bash installer/php-install.sh

echo "Setting up new templates"
update_template_dir apache2 https://gitlab.hyadescloud.com/hyadescloud/vesta-apache-template.git
update_template_dir nginx https://gitlab.hyadescloud.com/hyadescloud/vesta-nginx-templates.git

echo "Adding cron jobs"
bash cron/add-crons.sh