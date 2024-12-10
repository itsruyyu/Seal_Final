yum update -y
yum install -y httpd

service httpd start
chkconfig httpd on

echo "Welcome to $(hostname)" > /var/www/html/index.html
