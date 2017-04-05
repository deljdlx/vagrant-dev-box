sudo -s
apt-get update && apt-get upgrade && apt-get dist-upgrade -y

apt-get install -y pkg-config

apt-get install -y vim
apt-get install -y wget
apt-get install -y git
apt-get install -y screen



echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
wget https://www.dotdeb.org/dotdeb.gpg && apt-key add dotdeb.gpg
apt-get update
apt-get install -y php7.0
apt-get install -y php7.0-dev
apt-get install -y libzmq3-dev
apt-get install -y php-pear
pecl channel-update pecl.php.net


pecl install "channel://pecl.php.net/zmq-1.1.3"
echo 'extension=zmq.so' > /etc/php/7.0/mods-available/zmq.ini
echo 'extension=zmq.so' > /etc/php/7.0/cli/conf.d/20-zmq.ini
ln -s /etc/php/7.0/mods-available/zmq.ini /etc/php/7.0/apache2/conf.d/zmq.ini

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer


