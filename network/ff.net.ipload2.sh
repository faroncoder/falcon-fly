#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##

#echo -e "$Fok$Fyellow $( basename $0 ) $Foff"
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
			echo -e "$Fstat $THISIF cleared"
		else
			$SUDO ifconfig $THISIF:$N $CLR 2> /dev/null;
			echo -e "$Fstat $THISIF:$N cleared"
		fi
		N=`echo $(( $N + 1))`
}

while read line; do
	ff_ipsclear
done < $TMP0
> $TMP
> $TMP0
#$SUDO service networking restart

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ipload2.sh  [ACTIVE] y

