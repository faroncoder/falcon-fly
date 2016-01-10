startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=`echo $(( $startgreen - $stopred ))`
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}
TYPERES=$1
ID=$2
CLASS=$3
HTML=$4
if [ ! "$TYPERES" ]; then
    echo -n "FALCON: element type ? "
    read TYPERES
fi
if [ ! "$ID" ]; then
    echo -n "FALCON: id name? "
    read ID
fi
if [ ! "$HTML" ]; then
    echo -n "FALCON: which file to read for HTML injection? "
    read HTML
    if [ -f $HTML ]; then
        HTMLLOAD=$( cat $HTML )
    fi
fi
if [ ! "$CLASS" ]; then
    echo -n "FALCON: class name? "
    read CLASS
fi
FILEID=$( uuid | cut -d"-" -f1 )
FILE="/tmp/$FILEID.html"
echo "<nODe id=\"$ID\" class=\"$CLASS\">$HTMLLOAD</nODe>" > $FILE
COMMAND=$( sed -i -e "s/nODe/$TYPERES/g" $FILE )
$COMMAND
stopwatchtime
