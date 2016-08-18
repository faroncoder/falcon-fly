#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
if [[ "$1" != "" ]]; then
#################### BEGIN



THISFUILE="/tmp/$( uuid )"
makelister(){
		NUMB=$( cat $THISFUILE | wc -l )
		if [[ "$NUMB" == 0 ]]; then
			exit 0
		fi
		N=0
		while read line; do
			N=$( echo $(( $N + 1 )) )
			echo -e "$Fyellow$N$Foff $line"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$Fblue $NUMB $Foff"
}

if [[ ! -z "$2" ]]; then
		apt-cache search $1 | grep "$2" > $THISFUILE
		KEYWORD="$1 $2 $3"
elif [[ ! -z "$3" ]]; then
		apt-cache search $1 | grep "$2" | grep "$3"  > $THISFUILE
		KEYWORD="$1 $2"
else
		apt-cache search $1  > $THISFUILE
	 	KEYWORD="$1"
fi

makelister

echo -e "$Finfo Keyword searched: $Fred $KEYWORD $Foff"
echo -n -e "Item to install ? "
read ITEM

if [[ "$ITEM" == "" ]]; then
	exit 0
else
	while :
		do
		case "$ITEM" in
			$ITEM)
				for itemgrab in "${ITEM[@]}"; do
					ff.apt.fetch $( awk "NR==$itemgrab" $THISFUILE | awk '{ print $1 }' );
				done
					break
					;;
			esac
	done
	makelister	
fi


################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "$Fyellow enter keyword to search the repository $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

