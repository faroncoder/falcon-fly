#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader;
 ####################START

FALCON=/home/users/faron/.falcon/scripts

if [[ ! -d "$FALCON" ]]; then
		_send=_no; _comment="Falcon is not mounted. Exiting";
		_FR
		doneTime
	else

	if [[ "$@" != "" ]]; then
		CHECKD=( $@  )
		for k in "${CHECKD[@]}"; do
			FID=`find /home/users/faron/.falcon/scripts -type f -name "*$k*"`
			if [[ "$FID" != "" ]]; then
				COLLEC="$COLLEC $FID"
			else
				k="";
			fi
		done
		PICKUP=( ${COLLEC} )
	else
		PICKUP=( ` find /home/users/faron/.falcon/scripts -type f -name 'ff.*' ! -path ' */.git/*' ! -path '*/kills/*' ` );
	fi
	if [[  "$PICKUP" == ""  ]];  then

		_send=${CHR24}; _comment="None found";
		_FR
		doneTime
	fi
	COUN=`echo "${PICKUP[@]}" | wc -w`
	makelink(){

				EXT=".`echo $findme | rev | cut -d'.' -f1 | rev`"
				FILEBODY=`echo $findme | sed "s/$EXT//g"`
				NEWHOME=`basename $FILEBODY`
				BINLOC="/usr/local/bin/$NEWHOME"
				#echo "$entry --> $BINLOC"
				ln -s "$findme" "$BINLOC" 2> /dev/null
	}
	#LINKS=( `find -L /usr/local/bin -name 'ff.*'  ` )
	#EXISTING=`echo ${LINKS[@]} | wc -w`
	rm -r /usr/local/bin/ff.*
	#for linkme in "${LINKS[@]}"; do rm $linkme; COUNT=`echo $(( $COUNT + 1 ))`; done
	for findme in "${PICKUP[@]}"; do  makelink; FCOUNT=`echo $(( $FCOUNT + 1 ))`; done
	#ACCOUNTED=`echo $(( $COUNT - $FCOUNT ))`
	# if [[ "$ACCOUNTED" != 0 ]]; then
	# 	_send=$CHR24; _comment="Caution: Files are not accounted for"
	# 	_FR
	# fi
	source $HOME/.bashrc
		#echo "_ok Falcon Bin sync-ed."
			#export GETMSG=$CHR145; FTmsg;
			#echo "$FMsend So, you are this?$reset "
		#export GETMSG=$CHR99; FPmsg
		#	echo "$FMsend$COLR$RESSF$reset $k"
		#	echo "$FMsend Oh ok, ahem! $reset "
		#export GETMSG=$CHR145; FTmsg;
		#echo "$`FMsend $( echo "${FILEHUNT[@]}" | wc -w )`"
	#	echo "`FTmsg $( echo "${FILEHUNT[@]}" | wc -w )`"

		_send=${CHR23}; _comment="Confirmed ${b_purple} $COUN${reset} files as sync-ed.";
		_FG

		_send=${CHR182}; _comment="Total ${b_green} $COUN${reset} are sync-ed.";
		_FP


		_send=${CHR23}; _comment="Confirmed ${b_green} $COUN${reset} files as sync-ed.";
		_FG
		#CHEKCKFN=`find -L /usr/local/bin -type f -name 'ff.*' | wc -l`



		COMPR=`echo $(( $FCOUNT - $COUN ))`

		_send=${CHR230}; _comment="Total ${b_yellow}$COUN${reset} exists. ${b_blue}$COMPR${reset} files installed. "
		_FG

fi
#checkTime

 ####################STOP
doneTime
### [FILE] ff.load.sh  [ACTIVE] y
