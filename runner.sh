#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
	if [[ "$LGK" == "" ]]; then
		echo "dont have the format"
		file="";
	fi
	if [[ "$file" != "" ]]; then
	#NOM=`echo $file | sed 's/.sh//g'`
	#THIS="$NOM-old"
	#THIS=`echo $file | sed 'falcon-fly/new/g'`
	NEWN=`basename $file`
	THIS=`echo $NEWN | sed 's/.sh/-old/g' `
	NEWO=`dirname $file`
	NEWF=$NEWO/$NEWN
	NEWA=$NEWO/$THIS
	#PATHF="$NEWO/$NEWN.sh"
	#OLDF="$NEWO/$THIS"
	 #PATHF="$PWD/$NEWO/$NEWN"
	#echo $NEWF
	#echo  $NEWA


# #echo $PATHF
	mv $NEWF $NEWA
	cp header.txt $NEWF
	echo "####################START" >>  $NEWF


# 	if [[ "$CHK" == "" ]]; then
# 		echo ${_no}
# 		poor=""
# 	fi

# 		THIS=`echo $poor | sed 's/.\/scripts/new/g'`
# 		NEWN=`basename $THIS`
# 		NEWO=`dirname $THIS`
# 		PATHF="$PWD/$NEWO/$NEWN"
# 		cp $poor "$PATHF-old"
# 		cp header.txt $PATHF
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] runner.sh  [ACTIVE] y

