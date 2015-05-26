#!/bin/bash
startgreen=`date`

/bin/chown -R www-data:www-data /home/faron/var/Scripts/htmls/projects
/bin/chmod -R 775 /home/faron/var/Scripts/htmls/projects

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

