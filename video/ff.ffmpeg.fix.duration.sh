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
ffmpeg -fflags genpts -i "$INPUT" -flags +global_header -map 0:0 -vcodec copy -acodec copy "$PREFILE-fixed.$EXT" < /dev/null

#mv $INPUT $PREFILE_delete_me.$EXT

######## IGNORE BELOW -- LOGGING PURPOSE ######
#stopred=`date +%s000`;
#faronruntime=$(( $stopred - $startgreen ));
#echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
exit 0
