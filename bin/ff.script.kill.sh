#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/loader; startTime;
####################START
KILLHOME=$HOME/.falcon/scripts/kills
FALCON=$HOME/.falcon/scripts
FILES=( $@ )


killerScript(){
	jj=`uuid`
	bye=`echo $bye | sed 's/ff./dead./g' `
	FILEHERE=`basename $bye`
	KILLED=`echo $KILLHOME/$jj-$FILEHERE | sed 's/.sh//g' `	
}


deathReaper(){
	killerScript
	mv $bye $KILLED
 	if [[ -f "$KILLED" ]]; then 
 		chmod 555 $KILLED
		chmod -x $KILLED
 		_send=$CHR23; _comment="$FILEHERE successfully de-exexcuted and chmod-ized to read only."; 
		_FG
 	fi
}



# lauchUpdaterEngine(){

# 	KILLHOME="$FALCON/kills"
# 	THIS=`uuid`
# 	FILESTART=$FILELOC
# 	# tar -jcvf $HOME/Falcon_backup.tar.bz2 $FALCON

# 	cp -r $FALCON "$KILLHOME"
# 	mv $FALCON/scripts $FALCON/old_scripts
# 	kilerScript
# 	keepRecursive() {
# 		PAVE="Y"
# 		KILLCONFIRM="$PAVE"
# 	}
# 	find $KILLHOME -type f -name '*.sh'
# 	deathReaperCheck

# 	#echo "_info In upgrading mode: scripts updater"
# 	#echo "$_warn library is being backed up."
# }

keepRecursive() {
			PAVE="Y"
			KILLCONFIRM="$PAVE"
		}






	

# 	deathReaperCheck(){
# 	jj=`uuid`
# 	FILEHERE=`basename $FILESTART`
# 	KILLED="$FALCON/kills/$( echo $KILLHOME/$jj-$FILEHERE | sed 's/.sh//g' )"
# 	if [[ "$KILLCONFIRM" == "" ]]; then
# 		echo -n "$_warn kill $FILEHERE ? (y/Y) "
# 		read KILLCONFIRM
# 	elif [[ "$KILLCONFIRM" == "Y" || "$KILLCONFIRM" == "y" ]]; then
# 		mv $FILESTART $KILLED 2> /dev/null
# 		_send=$CHR23; _comment="$FILEHERE killed"; _FG;
# 		echo "`_ok` $FILEHERE killed"
# 		chmod -x $KILLED
# 		chmod 555 $KILLED
# 		_send=$CHR23; _comment="$FILEHERE de-executable and read-only"; _FY;
# 	else
# 		_send=$CHR24; _comment="$FILEHERE is not killed"; _FR;

# 	fi

# 	KILLCONFIRM=""
# }
spawnKills(){ 
	
	FILECOUNTD=`echo ${FILES[@]} | wc -w`
	echo $FILECOUNTD
	if [[ "$FILECOUNTD" == "0" ]]; then
			echo "No file found"
			doneTime
	else
		for find in "${FILES[@]}"; do
				DIGFILE=( `find $FALCON -type f -name "*$find*" ! -path '*/kills/*'` )
				
				FILECOUNTD=`echo -e ${CAMP[@]} | wc -w `
				COMPLY=`basename $find`
				_complyAskQ="Found $COMPLY: Push in for kill? "
				_complyVar0="y"
				_CMDA0=$( CAMP=( ${CAMP[@]} $file );` echo ${CAMP[@]} `)
				_complyClose="_send=$CHR23; _comment=\"Total files(s) to be killed: $FILECOUNTD\""
				_complyCloseComment="`echo ${CAMP[@]}`"
				
				_complyConfirm
			done
	fi
	for get in "${CAMP[@]}"; do
					
				FILECOUNT=`echo -e ${CAMP[@]} | wc -w`
				_complyAskQ="`_stat` Set to kill $FILECOUNT - proceed? "
				_complyVar0="y"
				_CMDA0=deathreaper
				_complyClose="$FILECOUNT are successfully killed."
				_complyConfirm
	done
}



		# if [[ "$KILLCONFIRM" == "Y" || "$KILLCONFIRM" == "y" ]]; then
		# 	mv $FILESTART $KILLED 2> /dev/null
		# 	_send=$CHR23; _comment="$FILEHERE killed"; _FY;
		# 	chmod -x $KILLED
		# 	chmod 555 $KILLED
		# 	_send=$CHR23; _comment="$FILEHERE de-executable and read-only"; _FY;
		# fi
	#     else
	#     	for findme in "${FILESTART[@]}"; do
	#     		IDENTIFY=`find $FALCON -type f -name "*$findme*"`
	#     		if [[ -f "$IDENTIFY" ]]; then
	#     			echo "$IDENTIFY found and pooled"
	#     			CAMP=( ${CAMP[@]} $IDENTIFY  )
	#     		else
	#     			echo "$IDENTIFY does not exist"
	#     			findme=""
	#     		fi
	#     	done
	#     	for kill in "${CAMP[@]}"; do
	#     			echo "File to be killed: $kill"
	#     	done
	#     fi
	# fi


	# if [[ -f "$PWD/$FILESTART" ]]; then
	# 	FILELOC="$PWD/$FILESTART"
	# 	echo $FILELOC #FILESTART=$FILELOC
	# 	deathReaper
	# else
	# 	COLLECT=( ` find $FALCON -type f -name "*$FILESTART*" -name '*.sh' ! -path "*/kills/*" ` )
	# 	if [[ "${COLLECT[@]}" == "" ]]; then
	# 		echo "`_no` no file found by that name"
	# 		doneTime
	# 	else
	# 		FILECOUNT=`echo ${COLLECT[@]} | tr ' ' '\n' | wc -l`


	# 		if [[ "$FILECOUNT" -gt 1 ]]; then
	# 			for FILESTART in "${COLLECT[@]}"; do
	# 				keepRecursive
	# 				deathReaperCheck
	# 			done
	# 		else
	# 			for FILESTART in "${COLLECT[@]}"; do
	# 				deathReaper
	# 			done
	# 		fi
	# 	COLLECT=""
	# fi


# lauchUpdaterEngine(){
# 	THIS=`uuid`
# 	KILLHOME="$FALCON/kills"
# 	FILESTART=$FILELOC
# 	#tar -jcvf $HOME/Falcon_backup.tar.bz2 $FALCON
# 	cp -r $FALCON "$KILLHOME"
# 	#mv $FALCON/scripts $FALCON/old_scripts
# 	COLLECTE=( `find $KILLHOME -type f -name '*.sh'` )
# 	for bye in "${COLLECTE[@]}"; do
# 		FILEHERE=$bye
# 		KILLCONFIRM=Y
# 		deathReaper

# 	done

# 	#echo "_info In upgrading mode: scripts updater"
# 	#echo "$_warn library is being backed up."
# }


while :
do
SELECT=""
 	case "$SELECT" in
		*) spawnKills; break; ;;
	esac
done

###################STOP
doneTime
### [FILE] ff.script.kill.sh  [ACTIVE] y
