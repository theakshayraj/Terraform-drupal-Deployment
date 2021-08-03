#!/bin/bash -e

#Installing PHP v7.4
sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install -y php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap}
php --version

#Installing nginx
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install nginx -y

sudo systemctl start nginx
sudo systemctl status nginx
sudo systemctl enable nginx