#!/bin/sh

source functions.sh;

echo "Updating system"
apt-get update -y 
apt-get upgrade -y

echo "Installing necessary packages"
apt-get install git zip -y

bash debian-9.sh

echo "Installing necessary packages"
bash php-install.sh

echo "Setting up new templates"

update_template_dir apache2 https://gitlab.hyadescloud.com/hyadescloud/vesta-apache-template.git
update_template_dir nginx https://gitlab.hyadescloud.com/hyadescloud/vesta-nginx-templates.git
