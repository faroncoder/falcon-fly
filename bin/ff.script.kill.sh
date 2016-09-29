#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
#if [[ "$1" != "" ]]; then
#################### BEGIN

FILESTART="$1"
BASE="/home/users/faron/.falcon/scripts"
KILLHOME="$BASE/kills"
killerScript(){
	jj=`uuid`
	FILEHERE=`basename $FILESTART`
	KILLED="$( echo $KILLHOME/$jj-$FILEHERE | sed 's/.sh//g' )"
}

deathReaper(){
	killerScript
	mv $FILESTART $KILLED 2> /dev/null
	echo "$Fok $FILEHERE killed"
	chmod 555 $KILLED
	chmod -x $KILLED
	echo "$Fok $FILEHERE de-executable and read-only"
}

deathReaperCheck(){
	jj=`uuid`
	FILEHERE=`basename $FILESTART`
	KILLED="$( echo $KILLHOME/$jj-$FILEHERE | sed 's/.sh//g' )"
	echo -n "$Fwarn kill $FILEHERE ? (y/Y) "
	read KILLCONFIRM
	if [[ "$KILLCONFIRM" == "Y" || "$KILLCONFIRM" == "y" ]]; then
		mv $FILESTART $KILLED 2> /dev/null
		echo "$Fok $FILEHERE killed"
		chmod -x $KILLED
		chmod 555 $KILLED
		echo "$Fok $FILEHERE de-executable and read-only"
	else
		echo "$Fno $FILEHERE is not killed"
	fi
	KILLCONFIRM=""
}

if [[ -f "$PWD/$FILESTART" ]]; then
			FILELOC="$PWD/$FILESTART"
			FILESTART=$FILELOC
			deathReaper
	else
			COLLECT=( ` find $BASE -type f -name "*$FILESTART*" -name '*.sh' ! -path "*/kills/*" ` )
			if [[ "${COLLECT[@]}" == "" ]]; then
				echo "$Fno no file found by that name"
				XeF
			fi
			FILECOUNT=`echo ${COLLECT[@]} | tr ' ' '\n' | wc -l`
			if [[ "$FILECOUNT" -gt 1 ]]; then
				for FILESTART in "${COLLECT[@]}"; do
						deathReaperCheck
				done
			else
				for FILESTART in "${COLLECT[@]}"; do
						deathReaper
					done
			fi
		COLLECT=""
fi
			#echo ${FILESTART[@]} | tr ' ' '\n'
			#varsGenerate
			#echo $FILECOUNT
			#echo $FILENO
			#echo $FILEM
		#else
		#	
		#	echo "${FILESTART[@]}"
		#	for filenameget in "${FILESTART[@]}"; do
		#		varsGenerate
		#		echo $FILENO
		#		echo $FILEM
		#		echo $FILECOUNT
		#	done
			#FILESTART=( ` find $BASE -type f -name "*$FILEQUERY*" ! -path "*/kills/*" ` )
			#echo "${FILESTART[@]}"
		
		# FILEM=`basename $filenameget`
		# FILENO=`echo $FILEM | sed 's/.sh//g'`
		# FILEKILL="$KILLHOME/$ji-$FILENO"
		# 
		# #FILELIVE="$LOC/$filenameget"
#}		

		# if [[ "$( `find $BASE -type f -name \"*$FILEQUERY*\" ` )" == "" ]]; then
		# 	echo "$Fno no such a file"
		# 	XeF
		# else
			#varsGenerate
			
#			FILESTART=( ` find $BASE -type f -name "*$FILEQUERY*" ! -path "*/kills/*" ` )
#			echo ${FILESTART[@]}
			#echo "$Finfo single file kill $delete => $FILEKILL"
			#mv $delete $FILEKILL 2> /dev/null
			#clearVars
		# fi
		# else
		# 	LOC="/home/users/faron/.falcon/scripts"
		# 	FILESTART=( ` find $LOC -type f -name "*$1*" ! -path "*/kills/*" ` )
		# 	
		# 	echo "$Finfo $FILECOUNT"
		# 	echo "$Finfo ${FILESTART[@]}"
		# fi






#varsGenerate

# locationSet(){
# 	if [[ -f  "$filenameget" ]]; then
# 		delete="$filenameget"
# 		engineGetScript
		
# 		clearVars
# 	else
# 		filenameget=""
# 		LOC="/home/users/faron/.falcon/scripts"
		
# 		#CLEANUP=( `echo ${FILESTART[@]} | tr ' ' '\n' | sed '/\/kills\//d' | tr '\n' ' '` )
		
# 	fi
# }

# locationSet

# if [[ "$2" != "all" ]]; then
# 	for check in "${FILESTART[@]}"; do
# 			delete="$check"
# 			engineGetScript
# 			clearVars
# 	done
# else
# 	for purge in "${FILESTART[@]}"; do
# 		FILEM=`basename $purge`
# 		echo -n "$Fwarn kill $FILEM ? (y/Y) "
# 		read KILLCONFIRM
# 		if [[ "$KILLCONFIRM" == "Y" || "$KILLCONFIRM" == "y" ]]; then
# 			delete="$purge"
# 			engineGetScript
# 			clearVars
# 		else
# 			echo "$Fno $FILEM not killed"
# 			clearVars
# 		fi
# 	done
# fi

# 	delete=$PWD/$1
# 	deathizeScript
# 	delete=""
# fi







# singleKill(){
# 	filegetdelete=( `find $LOC -type f -name "$1"` )
# 	CHECKFILES=`echo "$filegetdelete[@]}" | wc -w`
# 	#if [[ "$CHECKFILES" == 1 ]]; then
# 	CLEANUP=( `echo ${filegetdelete[@]} | tr ' ' \n' | sed '/\/home\/users\/faron\/.falcon\/scripts\/kills/d' | tr '\n' ' ' '`  )
# 	for singlekillgo in "${CLEANUP[@]}"; do
# 			delete=$singlekillgo
# 			fileid=`basename $singlekillgo`
# 			deathizeScript
# 			echo "$Fwarn $fileid killed"
# 	done
# 	singlekillgo=""
# 	CHECKFILES=""
# 	filegetdelete=""
#  }

# multiFiles(){
# 		LOC="/home/users/faron/.falcon/scripts"
#  		GETALL=( `find $LOC -type f -name "*$1*" -exec basename {} \; ` )
#  		CLEANUP=( ` echo "${GETALL[@]}" | tr ' ' '\n' | sed '/\/home\/users\/faron\/.falcon\/scripts\/kills/d' | tr '\n' ' '  ` )
# 		if [[ "${CLEANUP[@]}" == "" ]]; then 
# 			echo "$Fno no scripts found"
# 			XeF
# 		else
		
# 			else
# 				scriptExecutorAye				
# 			fi
# 		CLEANUP=""
# 		fi
# GETALL=""
# }


## find script from the folder holding all scripts


#if [[ ! -f "$$FILECHECK" ]]; then
#	echo "$Fno $GI - no such a file"
#else


#mv $PWD/$1 /home/users/faron/.falcon/scripts/kills/$jj-$GI
#mv "$XD/$XF" "$XD/old-$ji-$XF";
#echo -e "$Fstat $1 killed."
#fi

################### END
#cd $RETURN 1> /dev/null;
#else echo "$Fwarn Arg 1= $Fyellow Specific file to kill $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

