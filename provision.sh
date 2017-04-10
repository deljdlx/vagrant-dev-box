sudo -s
apt-get update && apt-get upgrade && apt-get dist-upgrade -y
apt-get update
apt-get upgrade
apt-get install -y vim
apt-get install -y git
apt-get install -y pkg-config


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



apt-get install -y npm


apt-get install -y apache2



a2enmod rewrite
