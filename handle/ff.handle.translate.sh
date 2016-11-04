#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
GRAB="${#1}"
TRNASLTE="$@"
LANG="es"
if [[ "$GRAB" == 3  ]]; then
	CHK=`echo $1 | grep '~'`
	if [[ "$CHK" != "" ]]; then
		LANG=`echo $1 | sed 's/~//g'`
		TRNASLTE=`echo $TRNASLTE | awk '{$1=""; print $0}'`
	fi
fi
FORMULAT=`echo $TRNASLTE | sed 's/ /+/g' | sed 's/?//g' | sed 's/&//g'`
APIKEY=AIzaSyCOagcFwhzewSG_KPAa3x1lD6pVxPw3WSM
URL="https://www.googleapis.com/language/translate/v2?key=$APIKEY&q=$FORMULAT&source=en&target=$LANG"

GET="`curl --silent --url $URL |  jq . | jq .'[].translations' | jq .[] | jq .translatedText` "
NEWFR="`echo $GET |  awk '{print $1}'`"
NEWLT="`echo $GET | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | awk '{ print $1 }'`"
KEEP="`echo $GET | awk '{ $1=""; print $0 }' | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | awk '{ $1=""; print $0 }' | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' `"
LAST="`echo $NEWLT |  tr '  ' ' ' |  sed 's/"//g' | sed 's/ //g'`"
FIRST="`echo $NEWFR |  tr '  ' ' ' | sed 's/"//g' | sed 's/ //g'`"
COMPELTE="$FIRST $KEEP $LAST"
echo "_ok ${COMPELTE}${_reset} "


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.translate.sh  [ACTIVE] y

