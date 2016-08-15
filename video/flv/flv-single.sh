#!/bin/bash
startgreen=`date +%s`

FILEGRAB="$1"
if [ -z "$FILEGRAB" ]
	then
	   echo -n "which movie file to convert for flv? "
	   read FILEGRAB
fi

NEWNAME="$( rev <<< "$FILEGRAB" | cut -d "." -f2 | rev )"
ffmpeg -i $FILEGRAB -y -vcodec libx264 -vprofile main -maxrate 1500k -bufsize 372k -pix_fmt yuv420p -vf "scale=trunc(oh*a/2)*2:240" -c:a libfdk_aac -b:a 128k -ac 2 -ar 44100 -f flv "$NEWNAME.flv"

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
