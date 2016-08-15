#!/bin/sh -e
<<<<<<< HEAD
PATHDIR="/usr/local/bin"
=======
PATHDIR="/home/faron/bin"
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
FINDLINK="$( find $PATHDIR -maxdepth 1 -name 'Link\ *' )"
if [ ! -z "$FINDLINK" ]
            then
                  rename 's/Link\ to\ //g' $PATHDIR/*
                  rename 's/.sh//g' $PATHDIR/*
<<<<<<< HEAD
<<<<<<< HEAD
                  DISPLAY=:0.0 /usr/bin/notify-send -i /home/users/$USER/var/Pictures/self/sunfaron.png "bin: $( echo $FINDLINK | sed 's/\/home\/faron\/.bin\///g' ) :: link cleaned up "
=======
                  DISPLAY=:0.0 /usr/bin//notify-send -i /home/users/$USER/var/Pictures/self/sunfaron.png "bin: $( echo $FINDLINK | sed 's/\/home\/faron\/bin\///g' ) :: link cleaned up "
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
fi
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
                  DISPLAY=:0.0 /usr/bin//notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: $( echo $FINDLINK | sed 's/\/home\/faron\/bin\///g' ) :: link cleaned up "
fi
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
