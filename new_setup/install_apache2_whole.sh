#!/bin/bash
export PATH=$PATH

if [[ "$USER" != "root" ]]; then
	echo " yourself in, Faron."
	exit 1
fi
if [ ! "$( which uuid )" ]; then
	ff.apt.fetch uuid
fi
BINPULL=/mnt/falcon/scripts/new_setup/vault
 #if [[ "$( find . -maxdepth 1 -type l -name 'htdocs' -exec ls -al {} \; | awk '{ print $11 }' )" != "/mnt/falcon/configs/htdocs" ]]; then
 		rm /etc/apache2/htdocs
 		cp -r /mnt/falcon/configs/htdocs /etc/apache2/
 		cd /etc/apache2 2> /dev/null
 		ln -s htdocs/apache-controls/apache2.conf
# else

 #fi

UUID=`uuid`
TMP="/tmp/$UUID"
 cp -r "$BINPULL" "$TMP"
cd "$TMP"

PACK=( dh-php5 libapache2-mod-php5 php5 php5-cgi php5-cli php5-common php5-curl php5-dev php5-exactimage php5-fpm php5-gd php5-geoip php5-imagick php5-imap php5-json php5-mcrypt php5-memcache php5-memcached php5-mongo php5-mysql php5-oauth php5-readline php5-sqlite php5-xcache php5-xmlrpc apache2 apache2-bin apache2-data apache2-dev apache2-utils )

for j in "${PACK[@]}"; do

	CHECK=$( dpkg -l | grep $j )
	if [[ -z "$CHECK"  ]]; then
		ff.apt.fetch $j
		CHECK=""
	fi
done



#"$TMP/./install_apache_mod_flv.sh"
tar -zxvf $TMP/apache_mod_h264_streaming-2.2.7.tar.gz
cd $TMP/mod_h264_streaming-2.2.7
./configure
make
make install
rm -r $TMP/mod_h264_streaming-2.2.7
cd /etc/apache2

 sh -c "echo \"LoadModule h264_streaming_module /usr/lib/apache2/modules/mod_h264_streaming.so\" > $TMP/mods-available/h264_streaming.load"
 sh -c "echo \"AddHandler h264-streaming.extensions  .mp4\" > $TMP/mods-available/h264_streaming.conf"
cd /etc/apache2/mods-enabled 2> /dev/null
 ln -s /etc/apache2/mods-available/h264_streaming.conf 2> /dev/null
 ln -s /etc/apache2/mods-available/h264_streaming.load 2> /dev/null




while read line; do  a2enmod $line; done < "$TMP/a2enmod_enabing_mods.txt"


cd /etc/php5/apache2
mv "$TMP/php.txt" "/etc/php5/apache2/php.ini"
# cp /tmp/vault/vault/php.txt ./php.ini

ff.apache.restart

exit 0



