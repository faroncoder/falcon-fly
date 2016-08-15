#!/bin/bash
startgreen=`date +%s`

/.bin/chown -R www-data:www-data /home/users/$USER/var/Scripts/htmls/projects
/.bin/chmod -R 775 /home/users/$USER/var/Scripts/htmls/projects

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0

