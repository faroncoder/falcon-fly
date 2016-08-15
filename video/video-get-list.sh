#!/bin/bash
startgreen=`date +%s`
TARGETPATH="$1"
HEREPATH="$2"

if [ -z "$TARGETPATH" ]
    then
        echo -n "which type listing? (mkv/mp4/webm) "
        read  TARGETPATH
fi

if [ -z "$HEREPATH" ]
    then
        echo -n "which folder? "
        read  HEREPATH
fi

if  [ "$TARGETPATH"="mkv" -o "$TARGETPATH"="mp4" -o "$TARGETPATH"="webm"  ]
    then
    GETPATH="$HEREPATH/$TARGETPATH"
    HOSTHERE="$( hostname )"
    LIST="$PWD/$HOSTHERE-$TARGETPATH.dat"
    LIST2="$PWD/$HOSTHERE-$TARGETPATH.list"
    
        if [ ! "$( ls -p $GETPATH/*.$TARGETPATH )" ]
            then
                echo "$GETPATH is empty"
            else
                > $LIST2
		find $GETPATH -maxdepth 1 -type f -name "*.$TARGETPATH" -exec basename {} \; >> $LIST2
                echo "$HOSTHERE-$TARGETPATH listing completed"
        fi
	#while read line
	#	do
	#		FILESEND=$( basename $line )
	#		echo $FILESEND >> $LIST2
	#done < $LIST
#	rm $LIST
	echo "$HOSTHERE-$TARGETPATH.list is ready in $PWD"
fi
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
