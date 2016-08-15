#!/bin/bash
startgreen=`date +%s`
##POPULATING VARIABLES
HOMEPATH="/home/users/$USER/var/streamings/files"
timestamp="$( date )"
<<<<<<< HEAD
LOG="/home/users/faron/.falcon/logs/media-encoding.log"
=======
<<<<<<< HEAD
LOG="/home/users/faron/.falcon/logs/media-encoding.log"
=======
LOG="/mnt/falcon/logs/media-encoding.log"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
HEIGHTWT="$1"
## collecting files into array but in order of size and if they are mkv files

## preps the function
	## flverstart
		function flverstart {
		files=( $( ls -s *.mkv | sort -n | awk '{ print $2 }' ) )
		if [ -z "$HEIGHTWT" ]
			then
			   echo -n "which resolution? 240 360 or * "
			   read HEIGHTWT
		fi
		for f in "${files[@]}"
				do
				fme="$( rev <<< "$f" | cut -d "." -f2 | rev )"
				## Sending log
				echo "$timestamp: flv-ing "$( basename $f )"." >> $LOG
				echo "$timestamp: $( basename $0 ) works on "$( basename $f )"." >> $LOG
				# fires the encoder and drops new encoded file in flv
				mediainfo $f >> "$HOMEPATH/mediainfos/$fme-mkv.info"
				echo "$timestamp: mediainfo $f " > $LOG
				ffmpeg -i $f -y \
				-vcodec libx264 \
				-vprofile main \
				-maxrate 1500k \
				-bufsize 372k \
				-pix_fmt yuv420p \
				-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
				-c:a libfdk_aac \
				-b:a 128k -ac 2 \
				-ar 44100 \
				-f flv "$fme.flv" </dev/null ## hand offs so script can exit as success
				## sending finish call to log
				echo  "$timestamp: $( basename $f ) converted to $fme.flv." >> $LOG
				mediainfo "$fme.flv" > "$HOMEPATH/mediainfos/$fme-flv.info"
				echo "$timestamp: mediainfo $HOMEPATH/$fmv.flv" >> $LOG
				echo "$timestamp: sending $f to master server" >> $LOG
				scp $f f1:/home/users/$USER/var/streamings/final/mkv/
				mv $f "$HOMEPATH/finish-mkv/"
				echo "$timestamp: $f sent" >> $LOG
				echo "$timestamp: sending $fmv.flv to master server" >> $LOG
				scp "$fme.flv" f1:/home/users/$USER/var/streamings/final/flv/
				mv "$fme.flv" "$HOMEPATH/finish-flv/"
				echo "$timestamp: $fmv.flv sent" >> $LOG
			done
		}

##function to check required folder
function flvcherk {
	MKVD="$HOMEPATH/finish-mkv"
	if [ -z "$MKVD" ]
		then
		    mkdir -p $MKVD
	fi
	FLVD="$HOMEPATH/finish-flv"
		if [ -z "$FLVD" ]
			then
			    mkdir -p $FLVD
		fi
}

## script log
function closelog {
	## completes the script and logs
		   	echo "$timestamp: $( basename $0 ) terminating." >> $LOG
}

cd $HOMEPATH/mkv
flvcherk
flverstart
closelog

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
## bin | video | flv-er
