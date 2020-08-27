+++
date = "2020-08-27"
title = "LAMP Stack on AWS EC2"
description = "The post demonstrates installation of LAMP stack on AWS EC2"
series = ["AWS", "LAMP"]
draft = "false"
+++

This post gives you a quick writeup on running a LAMP stack on AWS EC2 instance.

**LAMP is the acronym of**
- Linux
- Apache Web Server 
- MariaDB (Relational database)
- PHP (Serverside language)

**Steps to follow to install a LAMP Stack on AWS EC2**

1. Create an EC2 instance with the following specifications
    - Ubuntu 18.04 Server LTS OS
    - Minimum 1 vCPU & 2 GB of RAM
    - Minimum 8 GB of SSD
    - In Security policy,
      - Open SSH Port 22 to be accessed only from your local machine
      - Open HTTP Port 80 & HTTPS Port 443 to be accessed from any IP (0.0.0.0/0)
2. Connect to your EC2 instance via your preferred SSH Client. You will need to connect via the EC2 IP on Port 22 and user 'ubuntu'. Once connected, follow the below given procedure.
3. Update your Ubuntu repositories
```
sudo apt update
```
4. Install LAMP Stack
```
sudo apt install apache2 php libapache2-mod-php php-mysql mariadb-server phpmyadmin
```
5. Currently access to /var/www/html folder is only given to root. Change it to give access to the 'ubuntu' user.
```
sudo chown -R ubuntu:ubuntu /var/www/html
sudo chmod -R 755 /var/www/html 
```
6. Enter into the MariaDB shell to create database and new user. MariaDB currently does not  have a password for the root user. For production servers, this will need to be enabled.
```
sudo mysql -u root -p
(no password, just press Enter)
```

7. Inside the MariaDB shell, create the database, tables, new user and new user access. New user name is 'bda' and password is 'bda@dbit'. Access to  this new user is only via localhost. Access to this  database via the new user from any IP requires a few more steps of setup.
```
CREATE DATABASE form;

USE form;

CREATE TABLE info(id smallint primary key auto_increment,fname varchar(20), lname varchar(20),gender varchar(10), email varchar(30) UNIQUE, mobile bigint UNIQUE);

CREATE USER 'bda'@'localhost' IDENTIFIED BY 'bda@dbit';

GRANT ALL PRIVILEGES ON form.* TO 'bda'@'localhost';

FLUSH PRIVILEGES;

exit;
```
8. Restart the apache web service
```
sudo service apache2 restart
```

This is it! This should successfully install the LAMP stack on your AWS EC2 instance. You can now write your HTML & PHP files and link them to your MariaDB database. Just save all your HTML & PHP files to the /var/www/html folder and access your webpage via the EC2 IP. 

Happy computing!
 
