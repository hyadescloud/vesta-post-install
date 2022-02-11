apt-get update
apt install apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg


apt-get update
a2enmod proxy_fcgi setenvif