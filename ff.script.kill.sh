#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
####################START
lauchUpdaterEngine(){

	KILLHOME="/tmp/$THIS-discharged/kills"
	THIS=`uuid`
	FILESTART=$FILELOC
	tar -jcvf $HOME/Falcon_backup.tar.bz2 $FALCON

	cp -r $FALCON "$KILLHOME"
	mv $FALCON/scripts $FALCON/old_scripts
	kilerScript
	keepRecursive() {
		PAVE="Y"
		KILLCONFIRM="$PAVE"
	}
	find $KILLHOME-type f -name '*.sh'
	deathReaperCheck

	#echo "$_info In upgrading mode: scripts updater"
	#echo "$_warn library is being backed up."
}

keepRecursive() {
			PAVE="Y"
			KILLCONFIRM="$PAVE"
		}


	killerScript(){
	jj=`uuid`
	FILEHERE=`basename $FILESTART`
	KILLED="$( echo $KILLHOME/$jj-$FILEHERE | sed 's/.sh//g' )"
}
	deathReaper(){
	killerScript
	mv $FILESTART $KILLED 2> /dev/null
	echo "${_ok} $FILEHERE killed"
	chmod 555 $KILLED
	chmod -x $KILLED
	echo "${_ok} $FILEHERE de-executable and read-only"
}
	deathReaperCheck(){
	jj=`uuid`
	FILEHERE=`basename $FILESTART`
	KILLED="$( echo $KILLHOME/$jj-$FILEHERE | sed 's/.sh//g' )"
	if [[ "$KILLCONFIRM" == "" ]]; then
		echo -n "$_warn kill $FILEHERE ? (y/Y) "
		read KILLCONFIRM
	elif [[ "$KILLCONFIRM" == "Y" || "$KILLCONFIRM" == "y" ]]; then
		mv $FILESTART $KILLED 2> /dev/null
		echo "${_ok} $FILEHERE killed"
		chmod -x $KILLED
		chmod 555 $KILLED
		echo "${_ok} $FILEHERE de-executable and read-only"
	else
		echo "$_no $FILEHERE is not killed"
	fi
	KILLCONFIRM=""
}

	FILESTART="$@"
	if [[ "$KILLCONFIRM" == "Y" || "$KILLCONFIRM" == "y" ]]; then
		mv $FILESTART $KILLED 2> /dev/null
		echo "${_ok} $FILEHERE killed"
		chmod -x $KILLED
		chmod 555 $KILLED
		echo "${_ok} $FILEHERE de-executable and read-only"
	fi
	if [[ -f "$PWD/$FILESTART" ]]; then
		FILELOC="$PWD/$FILESTART"
		FILESTART=$FILELOC
		deathReaper
	else
		COLLECT=( ` find $BASE -type f -name "*$FILESTART*" -name '*.sh' ! -path "*/kills/*" ` )
		if [[ "${COLLECT[@]}" == "" ]]; then
			echo "$_no no file found by that name"
			doneTime
		fi
		FILECOUNT=`echo ${COLLECT[@]} | tr ' ' '\n' | wc -l`
		if [[ "$FILECOUNT" -gt 1 ]]; then
			for FILESTART in "${COLLECT[@]}"; do
				keepRecursive
				deathReaperCheck
			done
		else
			for FILESTART in "${COLLECT[@]}"; do
				deathReaper
			done
		fi
		COLLECT=""
	fi


lauchUpdaterEngine(){
	THIS=`uuid`
	KILLHOME="/tmp/$THIS-discharged/kills"
	FILESTART=$FILELOC
	#tar -jcvf $HOME/Falcon_backup.tar.bz2 $FALCON
	cp -r $FALCON "$KILLHOME"
	#mv $FALCON/scripts $FALCON/old_scripts
	COLLECTE=( `find $KILLHOME -type f -name '*.sh'` )
	for bye in "${COLLECTE[@]}"; do
		FILEHERE=$bye
		KILLCONFIRM=Y
		deathReaper

	done

	#echo "$_info In upgrading mode: scripts updater"
	#echo "$_warn library is being backed up."
}


while :
do
SELECT=""
 	case "$SELECT" in
 		--update) lauchUpdaterEngine;  break ;;
		*)  launchKiller; break ;;
	esac
done

###################STOP
doneTime
### [FILE] ff.script.kill.sh  [ACTIVE] y
