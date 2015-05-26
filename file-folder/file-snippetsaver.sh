#!/bin/bash
startgreen=`date +%s`
#find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT="$( find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet' )"

if [ -z "$COLELCT" ]
            then
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
            else
                  find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet' -exec mv {} /home/faron/var/Scripts/sublime/snippets/ \; -exec DISPLAY=:0.0 \; -exec /usr/bin/notify-send -i /home/faron/var/Pictures/self/sunfaron.png "snippet found and saved..." \;
fi
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
