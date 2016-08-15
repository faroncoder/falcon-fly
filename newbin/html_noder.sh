#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=`echo $(( $startgreen - $stopred ))`
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN

TYPERES=$1
ID=$2
CLASS=$3
HTML=$4

if [ ! "$TYPERES" ]; then
    echo -n "FALCON: element type ? "
    read TYPERES
fi
if [ ! "$ID" ]; then
    echo -n "FALCON: id name? "
    read ID
fi
if [ ! "$HTML" ]; then
    echo -n "FALCON: which file to read for HTML injection? "
    read HTML
    if [ -f $HTML ]; then
        HTMLLOAD=$( cat $HTML )
    fi
fi
if [ ! "$CLASS" ]; then
    echo -n "FALCON: class name? "
    read CLASS
fi
FILEID=$( uuid | cut -d"-" -f1 )
FILE="/tmp/$FILEID.html"


echo "<nODe id=\"$ID\" class=\"$CLASS\">$HTMLLOAD </nODe>" > $FILE
COMMAND=$( sed -i -e "s/nODe/$TYPERES/g" $FILE )
$COMMAND



 # if [[ "$TYPERES" = 'div' ]]; then

 #        fi
 #        if [[ "$TYPERES" = 'F' ]]; then
 #            sed -i -e "s/nODe/form/g" /tmp/testing.html
 #        fi
 #        if [[ "$TYPERES" = 'I' ]]; then
 #           sed -i -e "s/nODe/img/g" /tmp/testing.html
 #        fi
 #        if [[ "$TYPERES" = 'L' ]];  then
 #            sed -i -e "s/nODe/a/g" /tmp/testing.html
 #        fi
 #        if [[ "$TYPERES" = 'P' ]]; then
 #              sed -i -e "s/nODe/p/g" /tmp/testing.html
 #        fi


#NODE="NODETYPE id=\"$ID\" class=\"$CLASS\">{CUSTOM} NODEEND"
#NODECLEAN=$( echo $NODE | sed "s/NODETYPE/$( echo $NODETYPE)/g" )
#NODECLEANER=$( echo $NODECLEAN | sed "s/NODEEND/$( echo $NODEEND)/g" )

#echo $NODECLEANER >> /tmp/testing.html
## END
stopwatchtime

