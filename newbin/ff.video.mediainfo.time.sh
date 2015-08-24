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
	#CATCHNAME=`cat /tmp/catchme.txt | grep 'Complete name' | cut -d":" -f2 `
	#CATCHTIME=`cat /tmp/catchme.txt | grep 'Duration' | head -n 1 | cut -d":" -f2 `
	CATCHTIME=`echo $GETALLFILEINFO | grep 'Duration' | head -n 1 | cut -d":" -f2`
		if [ -z "$CATCHTIME" ]; then
			CATCHNAME='';
			CATCHTIME='';
			CATCHMD5ALL='';
			CATCHMD5='';
		else
			#echo -e "{\"MediaFile\":\"$CATCHNAME\",\"MediaTime\":\"$CATCHTIME\",\"MediaMd5sum\":\"$CATCHMD5\"}" >> /tmp/finalread.txt;
			LISTING=\""MediaFile":"$CATCHNAME","MediaTime":"$CATCHTIME","MediaMd5sum":"$CATCHMD5\""
			fm.insert faron mediacontrol "`echo $LISTING`"
			#fiLISTING=$( cat $LISTING | sed 's/ //g' )
		fi
}

GETALL=( `find $PWD -maxdepth 0 -type f -exec basename {} \; `)
for d in "${GETALL[@]}";
	do
		CATCHMD5ALL=`md5sum "$PWD/$d"`
		#CATCHNAME=`echo $CATCHMD5ALL | awk '{print $2 }'`
		CATCHNAME=$( echo "$PWD/$d" )
		CATCHMD5=`echo $CATCHMD5ALL | awk '{print $1}'`
		GETALLFILEINFO=( `mediainfo $CATCHNAME` )
		spawningMedia
	done

# fm.insert faron mediacontrol "$LISTING"


################### END
# elif [ "$1" = "" ];
# 	then
#   echo "usage: ff.video.mediainfo.time "
#   echo "example:    "
# fi

stopwatchtime
## TALON: ff.video.mediainfo.time


