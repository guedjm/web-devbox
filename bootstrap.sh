#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_6.x | bash -

apt-get update && apt-get install -y nodejs php5-cli php5-curl  git mysql-client apache2-utils

npm install -g gulp
npm install -g bower

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

if [ -f /home/vagrant/.bashrc ]; then
  cp /etc/skel/.bashrc /home/vagrant
  echo export PATH=$PATH:/home/vagrant/.config/composer/vendor/bin >> /home/vagrant/.bashrc
fi
