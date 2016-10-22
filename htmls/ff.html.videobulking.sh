#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN



GETUR=$1

if [[ "$GETUR" == "" ]]; then
	echo -n "$Finfo Location of URL: http(s)://"
	read GETUR
fi
    LOCURL=`echo $GETUR | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
 

# GET=$1
# if [[ "$GET"  == "" ]]; then
# 		echo -n "$Finfo url address? http(s)://"
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
# 	echo -n "$Finfo address to point files to? "
# 	read GETUR
# # fi

GETM=( `find -L . -maxdepth 1 -type f -name '*.mp4' -exec basename {} \;` )
GETW=( `find -L . -maxdepth 1 -type f -name '*.webm' -exec basename {} \; ` )
GETZ=( `echo ${GETM[@]} ${GETW[@]} ` )

for video in "${GETZ[@]}"; do
	/usr/local/bin/ff.html.videopager $video $LOCURL
	COUNT=`echo $(( $COUNT + 1 ))`
done
GETZ=""
echo "$Fok $COUNT files created"
/usr/local/bin/ff.handle.seq

if [[ "$2" != "ssl" ]]; then
	sed -i -e 's/https/http/g' $PWD/*
fi



################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/htmls/ff.html.videopager.sh [ACTIVE] y


