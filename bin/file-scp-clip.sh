#!/bin/sh -e
PATHDIR="/home/faron/bin"
FINDLINK="$( find $PATHDIR -maxdepth 1 -name 'Link\ *' )"
if [ ! -z "$FINDLINK" ]
            then
                  rename 's/Link\ to\ //g' $PATHDIR/*
                  rename 's/.sh//g' $PATHDIR/*
                  DISPLAY=:0.0 /usr/bin/notify-send -i /home/faron/lib/media/pic/self/sunfaron.png "bin: $( echo $FINDLINK | sed 's/\/home\/faron\/bin\///g' ) :: link cleaned up "
fi
exit 0
