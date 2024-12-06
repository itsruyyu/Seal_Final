#!/bin/bash
apt update && apt install -y apache2 mysql-client php libapache2-mod-php php-mysql
systemctl enable apache2
systemctl start apache2
