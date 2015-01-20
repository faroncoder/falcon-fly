#!/bin/bash
#find /home/faron/lib/script/sublime/User -maxdepth 1 -type f -name '*-snippet'
COLELCT="$( find /home/faron/lib/script/sublime/User -maxdepth 1 -type f -name '*-snippet' )"

if [ -z "$COLELCT" ]
            then
                  exit 0
            else
                  find /home/faron/lib/script/sublime/User -maxdepth 1 -type f -name '*-snippet' -exec mv {} /home/faron/lib/script/sublime/snippets/ \; -exec DISPLAY=:0.0 \; -exec /usr/bin/notify-send -i /home/faron/lib/media/pic/self/sunfaron.png "snippet found and saved..." \;
fi
exit 0
