#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;

#################### BEGIN

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
#|
echo "${CORRECTED[@]}";

for k in "${CORRECTED[@]}"; do
		if [[ -f "$k" ]]; then
			k=""
		fi
		RESSF=` du -sh $k 2>  /dev/null |  awk '{print $1}'  `
#		GETID=`echo $RESSF | awk '{print $0}'`
		#GETID=`echo $RESSF | awk '{$2=""; print $0}'`
#		SOURTED=( `echo $GETID | awk '{print $0}' | awk '{ print $1":"$2}'` )
		#awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $0; }' #|
		#awk '{ print $1":"$2 }' |
		#sed 's/:.\//:/g'/
		#`
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



	#	for ij in "${SOURTED[@]}"; do
			#SIZE=`echo $ij | awk '{print $1}'`
		#	DATA=`echo $ij | sed 's/:/ /g'`
		#	GETN=`echo $ij | awk '{print $1}'`
		#	GETL=`echo $ij | awk '{$1=""; print $0 }'`

	GETMSG=$CHR55
	FBmsg

	echo "$FMsend$COLR$RESSF$Foff $k"

	done


		#DATA=`echo $SIZE | sed 's/:/ /g'`
		#FILE=`echo $DATA | awk '{print $2}'`
		#echo "$Finfo $COLR $k $Foff " #$FILE
			#echo "$"
#			IDEF=`echo $ij | awk '{print $2}'`
#			COU=`echo $SIZE |  sed 's/K//g' | sed 's/M//g' | sed 's/G//g'`
			# if [[ "$COU" ]]; then
			# GB=`echo $ij | grep 'G'`
			# MB=`echo $ij | grep 'M'`
			# KB=`echo $ij | grep 'K'`
			# CHK="$GB $MB $KB"
			# # fi

		#FINA=`echo $SOURTED `d
 #| $SUDO head -n 11 | $SUDO sort -h



################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.folders.memory.sh [ACTIVE] y


