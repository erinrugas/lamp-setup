#!/bin/sh

#install apache
sudo apt install apache2 -y
sudo ufw allow in "Apache Full"
echo "type ip or localhost in browser to test if apache is working"

#install mariadb
sudo apt install -y mariadb-server mariadb-client -y

#secure mariadb
sudo mysql_secure_installation

#installing php
sudo apt install -y php libapache2-mod-php php-mysql

#install other php modules
sudo apt install -y php-common php-cli php-gd php-curl php-intl php-mbstring php-bcmath php-imap php-xml php-zip


#restart apache
sudo systemctl restart apache2

#create php info
echo "creating phpinfo"

#change permission of /var/www/html directory
sudo chown $USER:root -R /var/www/html
sudo chmod 777 -R storage

cat <<EOF > /var/www/html/phpinfo.php
<?php
phpinfo();

EOF

echo "Done create phpinfo. run localhost/phpinfo.php"


#apache2 config 
sudo a2enmod rewrite

#enable mod header
sudo a2enmod headers

sudo systemctl restart apache2
