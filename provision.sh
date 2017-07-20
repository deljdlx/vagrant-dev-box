export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

sudo -s
apt-get update && apt-get upgrade && apt-get dist-upgrade -y


apt-get install -y pkg-config


apt-get install ca-certificates

apt-get install -y vim
apt-get install -y wget
apt-get install -y git
apt-get install -y screen


echo '====Samba utils'
apt-get install -y smbclient
apt-get install -y cifs-utils


echo '====Install Virtualbox'
echo 'deb http://ftp.debian.org/debian jessie-backports main contrib' >> /etc/apt/sources.list
apt-get update
apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
apt-get -t jessie-backports install virtualbox


echo '====Install Vagrant'
wget https://releases.hashicorp.com/vagrant/1.9.5/vagrant_1.9.5_x86_64.deb
sudo dpkg -i vagrant_1.9.5_x86_64.deb
# Connaitre la version installée
#vagrant --version




echo '====Install PHP7'
echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
wget https://www.dotdeb.org/dotdeb.gpg && apt-key add dotdeb.gpg
apt-get update
apt-get install -y php7.0
apt-get install -y php7.0-dev
apt-get install -y php7.0-json

apt-get install -y php7.0-mcrypt
apt-get install -y php7.0-zlib
apt-get install -y php7.0-zip
apt-get install -y php7.0-mbstring
apt-get install -y php7.0-tokenizer
apt-get install -y php7.0-fpm
apt-get install -y php7.0-gd
apt-get install -y php7.0-mysql
apt-get install -y php7.0-cli
apt-get install -y php7.0-common
apt-get install -y php7.0-curl
apt-get install -y php7.0-opcache
apt-get install -y php7.0-json
apt-get install -y php7.0-imap
apt-get install -y php7.0-sqlite3
apt-get install -y php7.0-xdebug

echo '====Install PEAR'
apt-get install -y php-pear
pecl channel-update pecl.php.net

echo '====Install Composer'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer



echo '====Install ZMQ'
apt-get install -y libzmq3-dev
pecl install "channel://pecl.php.net/zmq-1.1.3"
echo 'extension=zmq.so' > /etc/php/7.0/mods-available/zmq.ini
echo 'extension=zmq.so' > /etc/php/7.0/cli/conf.d/20-zmq.ini
ln -s /etc/php/7.0/mods-available/zmq.ini /etc/php/7.0/apache2/conf.d/zmq.ini


echo '====Install Memcache'
echo 'deb http://ftp.de.debian.org/debian sid main ' >> /etc/apt/sources.list
apt-get update
apt-get install -y memcached
apt-get install -y php-memcached




echo '====Install Apache2'
sudo apt-get install apache2 apache2-doc apache2-utils
a2enmod rewrite
service apache2 restart



echo '====Install Nginx'
echo 'deb http://nginx.org/packages/mainline/debian/ jessie nginx' >> /etc/apt/sources.list
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
apt-get update
apt-get install -y nginx





echo '====Install MySQL'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
mysql -uroot -proot -e 'grant all privileges on *.* to root identified by "root";' mysql


echo '====Install PostgreSQL'
apt-get install -y postgresql-9.4 postgresql-client-9.4
apt-get install -y php7.0-pgsql




echo '====Install NPM'
apt-get install -y npm
mkdir -p /usr/local/lib/node_modules
sudo chown -R vagrant $(npm config get prefix)/{lib/node_modules,bin,share}







