#!/bin/bash
BINPULL=/media/falcon/setup/customized_setup

cp -r $BINPULL /tmp/
cd /tmp/customized_setup/ 2> /dev/null

PACK=( dh-php5 libapache2-mod-php5 php5 php5-cgi php5-cli php5-common php5-curl php5-dev php5-exactimage php5-fpm php5-gd php5-geoip php5-imagick php5-imap php5-json php5-mcrypt php5-memcache php5-memcached php5-mongo php5-mysql php5-oauth php5-readline php5-sqlite php5-xcache php5-xmlrpc apache2 apache2-bin apache2-data apache2-dev apache2-utils )

for j in "${PACK[@]}"; do 
ff.apt.fetch $j
done

$PWD/vault/./install_apache_mod_flv.sh
find $PWD -type f -name '*flv*' -exec sudo rm {} \;
tar -zxvf $PWD/vault/apache_mod_h264_streaming-2.2.7.tar.gz
cd $PWD/mod_h264_streaming-2.2.7
./configure
make
sudo make install
rm -r $PWD
cd /etc/apache2 2> /dev/null

if [[ "$( find . -maxdepth 1 -type l -name 'htdocs' -exec ls -al {} \; | awk '{ print $11 }' )" == '' ]]; then
		sudo ln -s /media/falcon/configs/htdocs
fi
if [ -z "$( find . -maxdepth 1 -type l -name '*apache2.conf' -exec ls -al {} \; | awk '{ print $11 }' | grep 'apache-controls' )" ]; then
		sudo mv apache2.conf "apache2_$(date).txt"
		sudo ln -s "$PWD/htdocs/apache-controls/$(hostname --short)_apache2.conf"  "$PWD/apache2.conf"
fi


sudo sh -c "echo \"LoadModule h264_streaming_module /usr/lib/apache2/modules/mod_h264_streaming.so\" > $PWD/mods-available/h264_streaming.load"
sudo sh -c "echo \"AddHandler h264-streaming.extensions  .mp4\" > $PWD/mods-available/h264_streaming.conf" 
cd $PWD/mods-enabled 2> /dev/null
sudo ln -s /etc/apache2/mods-available/h264_streaming.conf
sudo ln -s /etc/apache2/mods-available/h264_streaming.load

while read line; do sudo a2enmod $line; done < /tmp/customized_setup/vault/a2enmod_enabing_mods.txt


cd /etc/php5/apache2 2> /dev/null
sudo mv $PWD/php.ini "$PWD/orig_$( date | sed 's/ //g')_php.ini.txt"
sudo cp /tmp/customized_setup/vault/php.txt ./php.ini

ff.apache2.restart

exit 0



