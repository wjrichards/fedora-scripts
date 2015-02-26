#!/bin/bash

echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#         Installing LAMP Stack             #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] Key To Start'
sleep 2

# Installing Apache
echo '---------Installing Apache---------'
sudo yum install httpd
sleep 2

echo '---------Start httped---------'
sudo service httpd start
sleep 2

# Installing MySQL
echo '---------Installing MySQL---------'
sudo yum install mysql mysql-server
sleep 2

echo '---------Start MySQL---------'
sudo service mysqld start
sleep 2

echo '---------Configuring MySQL---------'
sudo /usr/bin/mysql_secure_installation
sleep 2

# Installing PHP
echo '---------Installing PHP---------'
sudo yum install php php-mysql
sleep 2

# Adding PHP Modules (Optional)
echo '---------Adding PHP Modules---------'
