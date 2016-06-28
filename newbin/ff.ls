#!/bin/bash
#RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then
	export PATH="$PATH:/usr/local/bin"
fi
export fcbk="$(tput setaf 0)";
export fcr="$(tput setaf 1)";
export fcg="$(tput setaf 2)";
export fcy="$(tput setaf 3)";
export fcb="$(tput setaf 4)";
export fcp="$(tput setaf 5)";
export fcc="$(tput setaf 6)";
export fcw="$(tput setaf 7)";
export fco="$(tput sgr0)";
export fcok="[$fcg OK $fco]";
export fcer="[$fcr ERR $fco]";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
if [[ "$1" != "" ]]; then
#################### BEGIN





#okno(){ echo -e \"$fcer void $fcy empty$fco\"" }
#okout(){ echo -e "$fcok $fcy$( echo \"fun\" )$fco" }


	if [[ ! "$1" ]]; then
		TER="NADA"
	else
		TER="$1"
	fi
	echo -e "$fcok $TER $fco";





################### END
#cd $RETURN
else echo -e "$fcer Arg 1=$fcy empty$fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y
