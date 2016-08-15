#!/bin/sh
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN


WEBROOT="/srv/www/default/htdocs"
VHOSTDIR="/srv/www/settings/sites"
EXTENSION=""
RESTARTCMD="/usr/bin/sudo service apache2 reload"

if [ "$1" != '' ]; then
  if [ ! -f "$VHOSTDIR$1.conf" ]; then
    cp "$VHOSTDIR/skeleton" "$VHOSTDIR$1$EXTENSION"
    echo "created $VHOSTDIR$1$EXTENSION"
  else
    mv "$VHOSTDIR$1.conf" "$VHOSTDIR$1$EXTENSION.bak"
    cp "$VHOSTDIR/skeleton" "$VHOSTDIR$1$EXTENSION"
    echo "created $VHOSTDIR$1$EXTENSION and made a backup of the existing conf"
  fi
  find "$VHOSTDIR$1$EXTENSION" -type f -exec sed -i "s/SKELETON/$1/" {} \;
  if [ ! -d "$WEBROOT$1/" ]; then
    mkdir "$WEBROOT$1/"
    chown -R www-data:www-data "$WEBROOT$1/"
    echo "created $WEBROOT$1/"
  else
    echo "$WEBROOT$1/ already exists"
  fi
  sudo a2ensite $1
  $RESTARTCMD
  echo "reloaded apache"
elif [ "$1" = 'help' ] || [ "$1" = '' ]; then
  echo "usage:"
  echo "sudo ff.vm.webserver.add"
  echo "example: to create hostname.localhost just run the command 'sudo ff.vm.webserver.add hostname.localhost'"
fi


################### END
stopwatchtime
## TALON: ff.vm.webserver.add


