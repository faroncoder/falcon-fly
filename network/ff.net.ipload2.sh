#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## b_red Fblack b_green b_yellow b_blue b_purple b_teal Fwhite reset ##

#echo -e "_ok$b_yellow $( basename $0 ) $reset"
TMP="/tmp/`uuid`"
TMP0="/tmp/`uuid`"
THISIF=`ff.network.devices | head -n 1`
hostname -i | tr ' ' '\n' > $TMP
hostname -I | tr ' ' '\n'>> $TMP
cat $TMP | sort | uniq | sed '/^$/d'> $TMP0
cat $TMP0
N=0

ff_ipLoad(){
		if [[ $N == 0 ]]; then
			$SUDO ifconfig $THISIF $CLR 2> /dev/null;
			$SUDO ifconfig $THISIF:$N $CLR 2> /dev/null;
			echo -e "_stat $THISIF cleared"
		else
			$SUDO ifconfig $THISIF:$N $CLR 2> /dev/null;
			echo -e "_stat $THISIF:$N cleared"
		fi
		N=`echo $(( $N + 1))`
}

while read line; do
	ff_ipsclear
done < $TMP0
> $TMP
> $TMP0
#$SUDO service networking restart

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ipload2.sh  [ACTIVE] y

