#!/bin/bash


#Provision script for deploying LAMP stack

sudo apt-get update -y
sudo apt-get upgrade -y


#Install Apache web server

sudo apt-get install apache2 -y


#Install MySQL
sudo apt-get install mysql-server -y


#Install PHP and required extensions
sudo apt-get install php libapache2-mod-php php-mysql -y


#Restart Apache2 to apply changes
sudo systemctl restart apache2
