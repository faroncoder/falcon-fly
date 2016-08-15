#!/bin/bash
export PATH=$PATH:/usr/local/bin
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
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
	sudo mv /etc/fstab /home/users/$USER/old_fstab
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

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.nfs.config.load "
#  echo "example:  ff.nfs.config.load  "
#fi
## TALON:
XeF

