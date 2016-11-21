#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
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
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] html_noder.sh  [ACTIVE] y

