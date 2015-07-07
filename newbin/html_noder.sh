#!/bin/bash
startgreen=`date +%s`
function stopwatchtime() {
	stopred=`date +%s`
	faronruntime=`echo $(( $startgreen - $stopred ))`
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN

if [ -z "$TYPERES" ]; then
    echo -n "FALCON: element type [Div|Form|Img|Link|Paragraph] ? "
    read TYPERES
else


	if [[ "$TYPERES" == "D" ]]; then
    TYPE="div"
	elif [[ "$TYPERES" == "F" ]]; then
    TYPE="form"
	elif [[ "$TYPERES" == "I" ]]; then
    TYPE="img"
	elif [[ "$TYPERES" == "L" ]];  then
    TYPE="a"
	elif [[ "$TYPERES" == "P" ]]; then
    TYPE="p"
	fi
fi
if [ -z "$ID" ]; then
    echo -n "FALCON: id name? "
    read ID
fi
if [ -z "$CLASS" ]; then
    echo -n "FALCON: class name? "
    read CLASS
fi
NODE="$( echo "<$TYPE id=\"$ID\" class=\"$CLASS\"><$TYPE>" )"
echo $NODE

## END
stopwatchtime

