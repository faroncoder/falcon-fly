#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

PACKAGES=( $@ )

for j in "${PACKAGES[@]}"; do 
	CHECKPAK=`dpkg -l | grep -e $j | awk '{ print $2 }' | head -n 1 `
	if [[ "$CHECKPAK" == "$j" ]]; then
		echo -e "_ok $b_yellow$j$b_green verified$clear in dpkg"
	else
		echo -e "$_no $b_yellow$j$b_red to be verified$clear"
		echo -e "$_warn installing $j"
		ff.apt.fetch $j
	fi
done


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.verify.sh  [ACTIVE] y

