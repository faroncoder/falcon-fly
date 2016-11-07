#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
source $HOME//.bash_colors

for i in {201..277}
do
	THIS=`echo $i | sed '/[0-9][0-9][8-9]/d'`;
	if [ "$THIS" != '' ]; then
	printf "$Green\342\230\\$i \n"
	fi
done


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] characters.sh  [ACTIVE] y

