#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
#!source /usr/bin/env bash

sudo apt-get update 2> /dev/null

sudo apt-get install -y make 2> /dev/null

sudo apt-get install -y vim 2> /dev/null

sudo apt-get install -y apache2 2> /dev/null
sudo apt-get install -y openssl 2> /dev/null
sudo a2enmod rewrite 2> /dev/null

APACHEUSR=`grep -c 'APACHE_RUN_USER=www-data' /etc/apache2/envvars`
APACHEGRP=`grep -c 'APACHE_RUN_GROUP=www-data' /etc/apache2/envvars`
if [ APACHEUSR ]; then
    sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
fi
if [ APACHEGRP ]; then
    sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars
fi
sudo chown -R vagrant:www-data /var/lock/apache2

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password ROOTPASSWORD'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password ROOTPASSWORD'
sudo apt-get install -y mysql-server 2> /dev/null
sudo apt-get install -y mysql-client 2> /dev/null

sudo sh -c "echo \"
<VIRTUALHOST *:80>
    ServerAdmin webmaster@localhost
    ServerName SKELETON
    ServerAlias www.SKELETON
    DocumentRoot /var/www/SKELETON
    <DIRECTORY />
        Options FollowSymLinks
        AllowOverride None
    </DIRECTORY>
    <DIRECTORY /srv/www/SKELETON/>
        Options +Indexes +FollowSymLinks
        AllowOverride All
    </DIRECTORY>

    ErrorLog ${APACHE_LOG_DIR}/SKELETON/SKELETON_error.log
    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn
    CustomLog ${APACHE_LOG_DIR}/SKELETON/SKELETON_access.log combined
</VIRTUALHOST>\" > /etc/apache2/sites-available/skeleton"

if [ ! -f /var/log/dbinstalled ];
then
    echo "CREATE USER 'mysqluser'@'localhost' IDENTIFIED BY 'USERPASSWORD'" | mysql -uroot -pROOTPASSWORD
    echo "CREATE DATABASE internal" | mysql -uroot -pROOTPASSWORD
    echo "GRANT ALL ON internal.* TO 'mysqluser'@'localhost'" | mysql -uroot -pROOTPASSWORD
    echo "flush privileges" | mysql -uroot -pROOTPASSWORD
    touch /var/log/dbinstalled
    if [ -f /vagrant/data/initial.sql ];
    then
        mysql -uroot -pROOTPASSWORD internal < /vagrant/data/initial.sql
    fi
fi

sudo apt-get install -y memcached libmemcached-tools 2> /dev/null

sudo apt-get install -y php5 php-pear php5-dev php5-gd php5-curl php5-mcrypt 2> /dev/null

yes | sudo pecl install memcache 2> /dev/null

sudo touch /etc/php5/cli/conf.d/memcache.ini
sudo touch /etc/php5/apache2/conf.d/memcache.ini
sudo sh -c "echo \"extension=memcache.so\" >> /etc/php5/apache2/conf.d/memcache.ini"
sudo sh -c "echo \"extension=memcache.so\" >> /etc/php5/cli/conf.d/memcache.ini"
sudo sh -c "echo \"memcache.hash_strategy=\"consistent\"\" >> /etc/php5/cli/conf.d/memcache.ini"
sudo sh -c "echo \"memcache.hash_strategy=\"consistent\"\" >> /etc/php5/apache2/conf.d/memcache.ini"

# if /var/www is not a symlink then create the symlink and set up apache
if [ ! -h /var/www ];
then
    mv /var/www  /var/old-www
    ln -fs /vagrant /var/www
    sudo a2enmod rewrite 2> /dev/null
    sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default
    sudo service apache2 restart 2> /dev/null
fi

# restart apache
sudo service apache2 reload 2> /dev/null

# copy addwebsite command
cp /vagrant/addwebsit  /usr/local/bin/addwebsite 2> /dev/null
chmod +  /usr/local/bin/addwebsite 2> /dev/null
cp /vagrant/skeleton /etc/apache2/sites-available/skeleton 2> /dev/null

sudo apt-get install -y git 2> /dev/null

sudo apt-get install -y subversion 2> /dev/null

# install phpmyadmin
mkdir /vagrant/phpmyadmin/ 2> /dev/null
wget -O /vagrant/phpmyadmin/index.html http://www.phpmyadmin.net/
awk 'BEGIN{ RS="<a *href *= *\""} NR>2 {sub(/".*/,"");print; }' /vvagrant/phpmyadmin/index.html >> /vagrant/phpmyadmin/url-list.txt
grep "http://sourceforge.net/projects/phpmyadmin/files/phpMyAdmin/" /vagrant/phpmyadmin/url-list.txt > /vagrant/phpmyadmin/phpmyadmin.url
sed -i 's/.zip/.tar.bz2/' /vagrant/phpmyadmin/phpmyadmin.url
wget -O /vagrant/phpmyadmin/phpMyAdmin.tar.bz2 `cat /vagrant/phpmyadmin/phpmyadmin.url`
mkdir /vagrant/myadm.localhost
tar jxvf /vagrant/phpmyadmin/phpMyAdmin.tar.bz2 -C /vagrant/myadm.localhost --strip 1
rm -rf /vagrant/phpmyadmin 2> /dev/null

# configure phpmyadmin
mv /vagrant/myadm.localhost/config.sample.inc.php /vagrant/myadm.localhost/config.inc.php
sed -i 's/a8b7c6d/NEWBLOWFISHSECRET/' /vagrant/myadm.localhost/config.inc.php
echo "CREATE DATABASE pma" | mysql -uroot -pROOTPASSWORD
echo "CREATE USER 'pma'@'localhost' IDENTIFIED BY 'PMAUSERPASSWD'" | mysql -uroot -pROOTPASSWORD
echo "GRANT ALL ON pma.* TO 'pma'@'localhost'" | mysql -uroot -pROOTPASSWORD
echo "GRANT ALL ON phpmyadmin.* TO 'pma'@'localhost'" | mysql -uroot -pROOTPASSWORD
echo "flush privileges" | mysql -uroot -pROOTPASSWORD
mysql -D pma -u pma -pPMAUSERPASSWD < /vagrant/myadm.localhost/examples/create_tables.sql
cat /vagrant/phpmyadmin.conf > /vagrant/myadm.localhost/config.inc.php

# set up mywebsite.localhost
if [ ! -d /vagrant/mywebsite.localhost ];
then
    git clone ssh://git@domain.com/repo/mywebsite.com /vagrant/mywebsite.localhost 2> /dev/null
    cp /vagrant/skeleton /etc/apache2/sites-available/mywebsite.localhost 2> /dev/null
    find /etc/apache2/sites-available/mywebsite.localhost -type f -exec sed -i "s/SKELETON/mywebsite.localhost/" {} \;
fi
if [ ! -d /var/lib/mysql/mywebsite ];
then
    echo "CREATE USER 'mysqluser'@'localhost' IDENTIFIED BY 'USERPASSWORD'" | mysql -uroot -pROOTPASSWORD
    echo "CREATE DATABASE mywebsite" | mysql -uroot -pROOTPASSWORD
    echo "GRANT ALL ON mywebsite.* TO 'mysqluser'@'localhost'" | mysql -uroot -pROOTPASSWORD
    echo "flush privileges" | mysql -uroot -pROOTPASSWORD
    if [ -f /vagrant/mywebsite.sql ];
    then
        mysql -uroot -pROOTPASSWORD mywebsite < /vagrant/mywebsite.sql 2> /dev/null
    fi
fi


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.setup.vm.sh  [ACTIVE] y

