
#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
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
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y
