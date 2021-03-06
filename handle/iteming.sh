#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
AB="$1"
CD="$2"
if [ -z "$AB" ]
	then
	echo -n "which folder to itemize? "
	read AB
fi
if [ -z "$CD" ]
	then
	echo -n "which folder to compare with? "
	read CD
fi

orderfile="$( find $AB -type f )"
orderfiles=( $orderfile )
comparefile="$( find "$CD" -type f )"
comparefiles( $comparefiles )
itemsfil="$( echo ${comparefiles[@]} )"
for file in "${orderfiles[@]}";
	do
		itemsfil="$( echo $itemsfil | sed "/\$file/d" )"
	done
echo $itemsfil

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] iteming.sh  [ACTIVE] y

