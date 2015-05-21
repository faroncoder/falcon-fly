#!/bin/bash
startgreen=`date +%s`
newfile="$1"
newbin="$HOME/.falcon/scripting/falcon-fly/newbin"
if [ -z "$1" ]
	then
	echo -n "name of new file? "
	read newfile
fi
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
touch $newbin/$proofreadfile
chmod +x $newbin/$proofreadfile
echo "#!/bin/bash
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0


stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
" >> $newbin/$proofreadfile
subl $newbin/$proofreadfile

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
