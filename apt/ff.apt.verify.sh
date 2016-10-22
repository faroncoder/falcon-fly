#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
if [[ "$1" != "" ]]; then
#################### BEGIN

PACKAGES=( $@ )

for j in "${PACKAGES[@]}"; do 
	CHECKPAK=`dpkg -l | grep -e $j | awk '{ print $2 }' | head -n 1 `
	if [[ "$CHECKPAK" == "$j" ]]; then
		echo -e "$Fok $Fyellow$j$Fgreen verified$Foff in dpkg"
	else
		echo -e "$Fno $Fyellow$j$Fred to be verified$Foff"
		echo -e "$Fwarn installing $j"
		ff.apt.fetch $j
	fi
done


################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow name of package to check in dpkg$Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


