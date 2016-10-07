#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN

GET=$1
if [[ "$GET"  == "" ]]; then
		echo -n "$Finfo url address? http(s)://"
		read GET
		OUTMA=`echo $GET | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
		GETACTU=`echo $OUTMA | tr '/' ' '`				
		### subdomain.example.com abc def
		LOCSET=`echo $GETACTU | awk '{print $1}'`
	else
		exit 0
fi


DOCPATH=`echo $PWD | tr '/' '|' | sed 's/|srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`
PATHD=`dirname $PWD`
PATHH=`basename $PWD`
HOMELOC="$PATHD/$PATHH"
LOCFIX=`echo $HOMELOC | tr '/' '|' | sed 's/srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`
TAG=`echo "https://$LOCSET$DOCPATH"`


# if [[ "$GETUR" == "" ]]; then
# 	echo -n "$Finfo address to point files to? "
# 	read GETUR
# # fi

GETM=( `find -L . -maxdepth 1 -type f -name '*.mp4' -exec basename {} \;` )
GETW=( `find -L . -maxdepth 1 -type f -name '*.webm' -exec basename {} \; ` )
GETZ=( `echo ${GETM[@]} ${GETW[@]} ` )

for video in "${GETZ[@]}"; do
	/usr/local/bin/ff.html.videopager $video $TAG
	COUNT=`echo $(( $COUNT + 1 ))`
	video=""
done
GETZ=""
echo "$Fstat $COUNT"

# #find -L . -maxdepth 1 -type f -name '*.webm' -exec /usr/local/bin/ff.html.videopager {}  $GETUR && COUNT=`echo $(( $COUNT + 1 ))` \;

# # if [[ "$URLBASELOC" == "" ]]; then
# # 	echo -n "$Finfo Location of URL: http(s)://"
# # 	read URLBASELOC
# # fi

# # if [[ "$GETUR" == "" ]]; then
# # 	echo -n "$Finfo Location of URL: http(s)://"
# # 	read GETUR
# # else
# #     LOCURL=`echo $GETUR | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
# #     FINALURL="https://$LOCURL"
# #     URLIN=`echo $FINALURL | sed 's/\/srv\/www\/default\/htdocs//g'`
# # fi

# # fireOffBulking(){
# # for video in "${GETALL[@]}"; do
# # 	/usr/local/bin/ff.html.videopager $video $URLBASELOC
# # 	video=""
# # 	COUNT=`echo $(( $COUNT + 1 ))`
# # done
# # }

# # GETALL=( `ls $PWD/*.mp4 2> /dev/null` )
# # if [[ "$GETALL" != "" ]]; then
# # 	fireOffBulking
# # else
# # 	echo "$Finfo no mp4's"
# # fi
# # GETALL=""
# # GETALL=( `ls $PWD/*.webm 2> /dev/null` )
# # if [[ "$GETALL" != "" ]]; then
# # 	fireOffBulking
# # else
# # 	echo "$Finfo no webm's"
# # fi
# echo "$Fok $COUNT files created"


################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/htmls/ff.html.videopager.sh [ACTIVE] y


