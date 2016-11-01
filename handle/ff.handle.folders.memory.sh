#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
####################BEGIN


# if [[ "$EUID" != 0 ]]; then
# 	SUDO="sudo"	#statements
# else
# 	SUDO=""
# fi

if [[ "$1" == "" ]]; then
	GMK=( `find . -maxdepth 1 -type d | sed '/.\./d' | sed 's/.\///g' | tail -n +2` )
else
	GMK=( $@ )
fi


#for i in G M K; do $SUDO du -ah |  $SUDO grep [0-9]$i | $SUDO sort -nr -k 1; done | $SUDO head -n 11 | $SUDO sort -h
for i in "${GMK[@]}"; do
	if [[ ! -d "$i" ]]; then
		i=""
	fi
	COLLECT=( ${COLLECT[@]} $i )
done
CORRECTED=(  `echo  "${COLLECT[@]}" | awk '{$1=""; print $0}'` )

for k in "${CORRECTED[@]}"; do
		if [[ -f "$k" ]]; then
			k=""
		fi
		RESSF=` du -sh $k 2>  /dev/null |  awk '{print $1}'  `

		CKG=`echo $RESSF | grep 'G'`
		CKK=`echo $RESSF | grep 'K'`
                        CKM=`echo $RESSF | grep 'M'`
			if [[ "$CKG" != "" ]]; then
				COLR="$FTeal"
				export GETMSG=$CHR97; ME=`FTmsg`
			elif [[ "$CKM" != "" ]]; then
				COLR="$Fyellow"
				export GETMSG=$CHR100; ME=`FYmsg`
			elif [[ "$CKK" != "" ]]; then
				COLR="$Fpurple"
				export GETMSG=$CHR99; ME=`FPmsg`
			else
				COLR=""
			fi

			GETMSG=$CHR125
			FYmsg

		echo "$FMsend$COLR$RESSF$Foff $k"
	done

####################END

doneTime
### [FILE] ff.handle.folders.memory.sh  [ACTIVE] y

