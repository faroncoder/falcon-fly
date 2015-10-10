#!/bin/bash
startgreen=`date +%s`
#find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT=( `find -L /home/faron/.config/sublime-text-3/Packages/User -maxdepth 1 -type f -name '*-snippet' -exec basename {} \;` )
if [  "$COLELCT" != '' ]; then
	for snippet in "${COLELCT[@]}"; do
		mv "/home/faron/.config/sublime-text-3/Packages/User/$snippet" "/home/faron/.falcon/code/sublime/mysnippets/$snippet" 2> /dev/null
		#DISPLAY=:0.0
		/usr/bin/notify-send "Snippet found and special archived"
	done

	 #  exec DISPLAY=:0.0 \; -exec /usr/bin//notify-send -i /home/faron/var/Pictures/self/sunfaron.png "snippet found and saved..." \;
fi
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
