#! /bin/sh

#install php-cli and unzip
sudo apt install php-cli unzip -y

#go to home directory
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php

#
HASH=`curl -sS https://composer.github.io/installer.sig`

#check composer if verified
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

#run composer
composer
