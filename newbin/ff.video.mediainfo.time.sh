#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START



spawningMedia() {
	#CATCHNAME=`cat /tmp/catchme.txt | grep 'Complete name' | cut -d":" -f2 `
	#CATCHTIME=`cat /tmp/catchme.txt | grep 'Duration' | head -n 1 | cut -d":" -f2 `
	CATCHTIME=`echo $GETALLFILEINFO | grep 'Duration' | head -n 1 | cut -d":" -f2`
		if [ -z "$CATCHTIME" ]; then
			echo "Right - you were supposed to have an arguement here."
		#	CATCHNAME='';
		#	CATCHTIME='';
		#	CATCHMD5ALL='';
		#	CATCHMD5='';
		else
			#echo -e "{\"MediaFile\":\"$CATCHNAME\",\"MediaTime\":\"$CATCHTIME\",\"MediaMd5sum\":\"$CATCHMD5\"}" >> /tmp/finalread.txt;
			LISTING=\""MediaFile":"$CATCHNAME","MediaTime":"$CATCHTIME","MediaMd5sum":"$CATCHMD5\""
			echo  "$LISTING"
			#fm.insert faron mediacontrol "`echo $LISTING`"
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


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.mediainfo.time.sh  [ACTIVE] y

