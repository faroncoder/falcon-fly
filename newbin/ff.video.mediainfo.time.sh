#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

# if [ "$1" != "" ]; then
#################### BEGIN



spawningMedia() {
	CATCHNAME=`cat /tmp/catchme.txt | grep 'Complete name' | cut -d":" -f2 `
	CATCHTIME=`cat /tmp/catchme.txt | grep 'Duration' | head -n 1 | cut -d":" -f2 `
		if [ -z "$CATCHTIME" ]; then
			CATCHNAME='';
			CATCHTIME='';
		else
			echo -e "{\"MediaFile\":\"$CATCHNAME\",\"MediaTime\":\"$CATCHTIME\"}" >> /tmp/finalread.txt;
		fi
}

GETALL=( * )
for d in "${GETALL[@]}";
	do
		mediainfo $d > /tmp/catchme.txt;
		spawningMedia;
	done
sed -i -e 's/ //g' /tmp/finalread.txt ;
cat /tmp/finalread.txt


################### END
# elif [ "$1" = "" ];
# 	then
#   echo "usage: ff.video.mediainfo.time "
#   echo "example:    "
# fi

stopwatchtime
## TALON: ff.video.mediainfo.time


