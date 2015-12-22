#!/bin/sh -e
MESSAGE=$1
ICON=$2
if [ ! "$MESSAGE" ]; then
        MESSAGE="blank message"
fi
if [ ! "$ICON" ]; then
        ICON=/home/faron/Pictures/falcon.jpg
fi

notify-send "$MESSAGE" -i $ICON < /dev/null

exit 0
