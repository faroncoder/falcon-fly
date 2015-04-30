#!/bin/bash
#find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT="$( find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet' )"

if [ -z "$COLELCT" ]
            then
                  exit 0
            else
                  find /home/faron/var/Scripts/sublime/User -maxdepth 1 -type f -name '*-snippet' -exec mv {} /home/faron/var/Scripts/sublime/snippets/ \; -exec DISPLAY=:0.0 \; -exec /usr/bin/notify-send -i /home/faron/var/Pictures/self/sunfaron.png "snippet found and saved..." \;
fi
exit 0
