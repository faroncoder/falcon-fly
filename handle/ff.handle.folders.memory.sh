#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
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
				COLR="$Fred"
			elif [[ "$CKK" != "" ]]; then
				COLR="$Fyellow"
			elif [[ "$CKM" != "" ]]; then
				COLR="$Fgreen"
			else
				COLR=""
			fi
		GETMSG=$CHR55
		FYmsg
		echo "$FMsend$COLR$RESSF$Foff $k"
	done

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.folders.memory.sh [ACTIVE] y


