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

echo "Configuring git client ..."
echo -n "Username : "
read username
echo -n "Email address: "
read email

git config --global user.name $username
git config --global user.email $email

echo "Creating ssh key ..."
echo -n "Passphrase: "
read passphrase
ssh-keygen -t rsa -b 4096 -C $email -P $passphrase
