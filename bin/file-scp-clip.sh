#!/bin/sh -e
PATHDIR="/usr/local/bin"
FINDLINK="$( find $PATHDIR -maxdepth 1 -name 'Link\ *' )"
if [ ! -z "$FINDLINK" ]
            then
                  rename 's/Link\ to\ //g' $PATHDIR/*
                  rename 's/.sh//g' $PATHDIR/*
<<<<<<< HEAD
                  DISPLAY=:0.0 /usr/bin/notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: $( echo $FINDLINK | sed 's/\/home\/faron\/.bin\///g' ) :: link cleaned up "
=======
                  DISPLAY=:0.0 /usr/bin//notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: $( echo $FINDLINK | sed 's/\/home\/faron\/bin\///g' ) :: link cleaned up "
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
fi
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
