#!/bin/bash
stargreen=`date +%s000`;
######## IGNORE ABOVE -- LOGGING PURPOSE ######
if [ -z "$1" ]
	then
	echo -n "which file to fix? "
	read newfile
fi

PREFILE="$( rev <<< $INPUT | cut -d "." -f2 | rev )"
EXT="$( rev <<< $INPUT | cut -d "." -f1 | rev )"

##INPUT=$( find "$PATHDIR" -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )

ffmpeg -fflags genpts -i "$INPUT" -flags +global_header -map 0:0 -c:v copy -c:a copy "$PREFILE.fixed.$EXT" < /dev/null

######## IGNORE BELOW -- LOGGING PURPOSE ######
stopred=`date +%s000`;
faronruntime=$(( $stopred - $startgreen ));
echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
exit 0
