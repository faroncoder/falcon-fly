#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
if [[ "$1" != "" ]]; then
#################### BEGIN


filecheck=`which $1`
<<<<<<< HEAD
ffilb="/usr/local/bin/$1"
if [[ -f "$filecheck" ]]; then
	if [[ "$( hostname -s )" == "f6" ]]; then
		nano $filecheck
	fi
	if [[ "$( hostname -s )" == "f8" ]]; then
		subl $filecheck
	fi
	echo $Fok

=======
if [[ -f "$filecheck" ]]; then
	subl $filecheck	
	echo $Fok
>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43
else
	echo "$Fno $Fgreen $1 $Foff is not a live command"
fi


################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow which live command to be edited? $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/bin/ff.script.new  [ACTIVE] y


