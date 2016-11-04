#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START



CHECK=`find $HOME/Raws -maxdepth 1 -type f -name 'ffmpeg' `

COMMAND=`basename $CHECK`


	# if [[  "$COMMAND" == "ffmpeg-stop" ]]; then
	# 	rm $CHECK
	# 	#CHKPID=`pidof ffmpeg`
	# 	exit 1
	# 	#DOSTOP=`kill $CHKPID -9`
	# 	echo "`_warn` FFMPEG engine stopped. $COUNT files completed."
	# 	rm $RAWHOME/ffmpeg-stop
	# fi
	if [[ "$COMMAND" == "ffmpeg-pause" ]]; then
		CHKPID=`pidof ffmpeg`
		kill "$CHKPID" STOP
		echo -n "`_warn` FFMPEG is now paused....'p' to unpause the process"
		read JOBBACK
		if [[ "$JOBBACK" == "p" ]]; then
			kill $CHKPID CONTINUE
			_ok
			#statements
		fi
	fi


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.translate.sh  [ACTIVE] y

