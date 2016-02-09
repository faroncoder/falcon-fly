#!/bin/bash
export PATH=$PATH

if [[ "$USER" != "root" ]]; then 
	echo "sudo yourself in, Faron."
	exit 1
fi
if [ -z "$( which uuid )" ]; then
	ff.apt.fetch uuid
fi
BINPULL=/mnt/falcon/scripts/new_setup/vault
 if [[ "$( find . -maxdepth 1 -type l -name 'htdocs' -exec ls -al {} \; | awk '{ print $11 }' )" != "/mnt/falcon/configs/htdocs" ]]; then
 		rm -r htdocs
 		sudo ln -s "/mnt/falcon/configs/htdocs" "/etc/apache2/htodcs"
 else
 		echo "/etc/apache2/htodcs is pointing to configs correctly."
 fi

# UUID=`uuid`
# TMP="/tmp/$UUID"
# sudo cp -r "$BINPULL" "$TMP"
# cd "$TMP" 2> /dev/null

# PACK=( dh-php5 libapache2-mod-php5 php5 php5-cgi php5-cli php5-common php5-curl php5-dev php5-exactimage php5-fpm php5-gd php5-geoip php5-imagick php5-imap php5-json php5-mcrypt php5-memcache php5-memcached php5-mongo php5-mysql php5-oauth php5-readline php5-sqlite php5-xcache php5-xmlrpc apache2 apache2-bin apache2-data apache2-dev apache2-utils )

# for j in "${PACK[@]}"; do 
# ff.apt.fetch $j
# done

# "$TMP/./install_apache_mod_flv.sh"
# tar -zxvf $TMP/apache_mod_h264_streaming-2.2.7.tar.gz
# cd $TMP/mod_h264_streaming-2.2.7
# ./configure
# make
# sudo make install
# rm -r $TMP/mod_h264_streaming-2.2.7
# cd /etc/apache2 2> /dev/null

# if [[ "$( find . -maxdepth 1 -type l -name 'htdocs' -exec ls -al {} \; | awk '{ print $11 }' )" != "/mnt/falcon/configs/htdocs" ]]; then
# 		rm htdocs
# 		sudo ln -s /mnt/falcon/configs/htdocs
# else
# 		echo "/etc/apache2/htodcs is pointing to configs correctly."

# fi
# if [ -z "$( find . -maxdepth 1 -type l -name '*apache2.conf' -exec ls -al {} \; | awk '{ print $11 }' | grep 'apache-controls' )" ]; then
# 		sudo mv apache2.conf "apache2_$(date).txt"
# 		sudo ln -s "$TMP/htdocs/apache-controls/$(hostname --short)_apache2.conf"  "$TMP/apache2.conf"
# fi

# sudo sh -c "echo \"LoadModule h264_streaming_module /usr/lib/apache2/modules/mod_h264_streaming.so\" > $TMP/mods-available/h264_streaming.load"
# sudo sh -c "echo \"AddHandler h264-streaming.extensions  .mp4\" > $TMP/mods-available/h264_streaming.conf" 
# cd /etc/apache2/mods-enabled 2> /dev/null
# sudo ln -s /etc/apache2/mods-available/h264_streaming.conf 2> /dev/null
# sudo ln -s /etc/apache2/mods-available/h264_streaming.load 2> /dev/null




while read line; do sudo a2enmod $line; done < "$TMP/a2enmod_enabing_mods.txt"


cd /etc/php5/apache2 2> /dev/null
mv "$TMP/php.txt" "/etc/php5/apache2/php.ini"
#sudo cp /tmp/vault/vault/php.txt ./php.ini

ff.apache2.restart

exit 0



