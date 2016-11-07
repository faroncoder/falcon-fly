#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
#################### BEGIN


AliasName=$1

CMD=`echo $@ | awk '{$1=""; print $0 }'`

if [[ "$AliasName" == "" ]]; then
	echo -n  "`_stat` alias name ? ";
	read AliasName
fi
if [[ "$CMD" == "" ]]; then
	echo  -n "`_stat` command ? ";
	read CMD
fi
#echo -e _ok"$b_yellow $( basename $0 ) $reset"
echo "alias $AliasName=\"$CMD\"" > source /usr/local/lib/faron_falcon/alias
_ok
source $HOME/.bashrc

################### END
doneTime
### [FILE] ff.alias.add.sh  [ACTIVE] y
