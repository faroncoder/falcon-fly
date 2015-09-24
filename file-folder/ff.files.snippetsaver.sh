#!/bin/bash
startgreen=`date +%s`
#find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT=( `find /home/fly/code/sublime/User -maxdepth 1 -type f -name '*-snippet' -exec basename {} \;` )
if [  "$COLELCT" != '' ]
	for snippet in "${COLELCT[@]}";
		do
		mv "/home/fly/code/sublime/User/$snippet" "/home/fly/code/sublime/mysnippets/$snippet"  2>/dev/null
		DISPLAY=:0.0
		/usr/bin/.notify-send "Snippet found and special archived"
	else

      else
	   exec DISPLAY=:0.0 \; -exec /usr/bin//notify-send -i /home/faron/var/Pictures/self/sunfaron.png "snippet found and saved..." \;
fi
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
