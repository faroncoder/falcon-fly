#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

PACKAGES=( $@ )

for j in "${PACKAGES[@]}"; do 
	CHECKPAK=`dpkg -l | grep -e $j | awk '{ print $2 }' | head -n 1 `
	if [[ "$CHECKPAK" == "$j" ]]; then
		echo -e "${_ok} $Fyellow$j$Fgreen verified$Foff in dpkg"
	else
		echo -e "$Fno $Fyellow$j$Fred to be verified$Foff"
		echo -e "$Fwarn installing $j"
		ff.apt.fetch $j
	fi
done


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.verify.sh  [ACTIVE] y

