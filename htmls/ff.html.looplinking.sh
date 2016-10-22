#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

LOC=$1
if [[ "$LOC" == "" ]]; then
	LOC=$PWD
fi
COLLECT=( `find $LOC -maxdepth 1 -type f -name '*.mp4' -exec basename {} \;` )
for file in "${COLLECT[@]}"; do
	fileme=`echo $file | rev | cut -d'.' -f2 | rev`
	_Html=` echo "<a href=\"http://64.140.118.115:8800/$fileme.mp4\"><img src=\"http://64.140.118.115:8800/thumbs/$fileme.png\"></a>" `
	echo "$_Html" >> links.html
done

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


