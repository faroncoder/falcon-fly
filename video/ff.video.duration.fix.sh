#!/bin/bash
stargreen=`date +%s000`;
######## IGNORE ABOVE -- LOGGING PURPOSE ######
if [ -z "$1" ]
	then
	echo -n "which file to fix? "
	read INPUT
fi

INPUT="$1"
PREFILE="$( rev <<< $INPUT | cut -d"." -f2 | rev )"
EXT="$( rev <<< $INPUT | cut -d "." -f1 | rev )"

##INPUT=$( find "$PATHDIR" -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )

#ffmpeg -fflags genpts -i "$INPUT" -flags +global_header -map 0:0 -codec copy "$PREFILE.fixed.$EXT" < /dev/null
ffmpeg -fflags genpts -i "$INPUT" -flags +global_header -map 0:0 -codec:v copy -codec:a copy "$PREFILE_fixed.$EXT" < /dev/null

mv "$INPUT" "del_$INPUT"

#mv $INPUT $PREFILE_delete_me.$EXT

######## IGNORE BELOW -- LOGGING PURPOSE ######
#stopred=`date +%s000`;
#faronruntime=$(( $stopred - $startgreen ));
<<<<<<< HEAD
#echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
#echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
#echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
exit 0
