#!/bin/bash
#Scripts to start services if not running
ps -ef | grep nginx |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/nginx start > /dev/null
fi

ps -ef | grep mysql |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/mysql start > /dev/null 
fi

ps -ef | grep php5.6-fpm |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/php5.6-fpm start > /dev/null
fi

ps -ef | grep php7.4-fpm |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/php7.4-fpm start > /dev/null 
fi

ps -ef | grep php8.0-fpm |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/php8.0-fpm start > /dev/null 
fi

ps -ef | grep apache2 |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/apache2 start > /dev/null 
fi

ps -ef | grep php7.3-fpm |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/php7.3-fpm start > /dev/null 
fi

ps -ef | grep php7.2-fpm |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/php7.2-fpm start > /dev/null 
fi

ps -ef | grep nginx |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/nginx start > /dev/null 
fi


ps -ef | grep bind9 |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/bind9 start > /dev/null 
fi


ps -ef | grep exim4 |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/exim4 start > /dev/null 
fi

ps -ef | grep proftpd |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/proftpd start > /dev/null 
fi

ps -ef | grep iptables |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/iptables start > /dev/null 
fi

ps -ef | grep fail2ban |grep -v grep > /dev/null
if [ $? != 0 ]
then
       /etc/init.d/fail2ban start > /dev/null 
fi
