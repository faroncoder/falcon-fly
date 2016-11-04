#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START



GETUR=$1

if [[ "$GETUR" == "" ]]; then
	echo -n "${_info} Location of URL: http(s)://"
	read GETUR
fi
    LOCURL=`echo $GETUR | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
 

# GET=$1
# if [[ "$GET"  == "" ]]; then
# 		echo -n "${_info} url address? http(s)://"
# 		read GET
# 		OUTMA=`echo $GET | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
# 		GETACTU=`echo $OUTMA | tr '/' ' '`				
# 		### subdomain.example.com abc def
# 		LOCSET=`echo $GETACTU | awk '{print $1}'`
# 	else
# 		exit 0
# fi


# DOCPATH=`echo $PWD | tr '/' '|' | sed 's/|srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`
# PATHD=`dirname $PWD`
# PATHH=`basename $PWD`
# HOMELOC="$PATHD/$PATHH"
# LOCFIX=`echo $HOMELOC | tr '/' '|' | sed 's/srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`
# TAG=`echo "https://$LOCSET$DOCPATH"`


# if [[ "$GETUR" == "" ]]; then
# 	echo -n "${_info} address to point files to? "
# 	read GETUR
# # fi

GETM=( `find -L . -maxdepth 1 -type f -name '*.mp4' -exec basename {} \;` )
GETW=( `find -L . -maxdepth 1 -type f -name '*.webm' -exec basename {} \; ` )
GETZ=( `echo ${GETM[@]} ${GETW[@]} ` )

for video in "${GETZ[@]}"; do
	source /usr/local/bin/ff.html.videopager $video $LOCURL
	COUNT=`echo $(( $COUNT + 1 ))`
done
GETZ=""
echo "${_ok} $COUNT files created"
source /usr/local/bin/ff.handle.seq

<<<<<<< HEAD
if [[ "$2" != "ssl" ]]; then
	sed -i -e 's/https/http/g' $PWD/*
fi



=======
>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.html.videobulking.sh  [ACTIVE] y

