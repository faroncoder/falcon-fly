#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
	### GO TO /MEDIA AND ADD FOLDERS AS MANY AS YOU WANT BY 	mkdir -p <name  of folder>.  THIS WILL POPULATE INTO ARRAY AND USES IT TO CREATE NETWORK FOLDERS TO CORRESPOND TO THESE FOLDERS YOU JUST CREATED - ALL BY THE FLY !
	GETARRAY=( $( sudo find /media -maxdepth 1 -type d -exec basename {} \; | sed '/media/d' | sed '/cdrom/d' | tr '\n' ' ' ) )
	GETTOTAL=$( echo "${GETARRAY[@]}" | wc -w )
	GETZERO=1

function StartProcess {
	grep 'UUID' /etc/fstab >> "$HOME/fstab.new"
	for n in "${GETARRAY[@]}"; do
		GETRT=$( awk -v t1="$GETZERO" -v t2="$GETTOTAL" -v t3="100" 'BEGIN{printf "%.0f",  ( t1/t2 ) * t3 }' );
		echo "Folder $n: $GETZERO of $GETTOTAL | $( echo $GETRT\% )";
		GETZERO=$( echo $(( $GETZERO + 1 )) );
		mkdir -p "/home/$USER/.$n" 2> /dev/null;
		echo "192.168.1.6:/media/$n   /media/$n  nfs  rw,hard,intr  0   0" >> "$HOME/fstab.new"
		echo "/media/$n /home/$USER/.$n  none  bind  0  0" >> "$HOME/fstab.new"
	done
	sudo mv /etc/fstab /home/faron/old_fstab
	sudo mv "$HOME/fstab.new" /etc/fstab
	sudo mount -a
}

function checkStatus {
	if [[ $GETTOTAL -gt 0 ]]; then
		ENABLECONF=1
		export STATUS="enabling auto-configuration"
		echo $STATUS
		StartProcess
	fi
	if [[ "$GETZERO" == "$GETTOTAL" ]]; then
		ENABLECONF=2
		export STATUS="disabling auto-configuration"
		GETARRAY=""
	fi
}

	ENABLECONF=0
	checkStatus

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.nfs.config.load.sh  [ACTIVE] y

