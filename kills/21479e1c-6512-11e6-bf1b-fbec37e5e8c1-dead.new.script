#!/bin/bash
startgreen=`date +%s`
function stopwatchtime {
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}
######## IGNORE ABOVE -- LOGGING PURPOSE ########
######## use 'stopwatchtime' instead of 'exit 0' ########
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
startgreen=\`date +%s\`
function stopwatchtime() {
	stopred=\`date +%s\`
	faronruntime=\$( echo \"\$(( \$startgreen - \$stopred\` ))\" );
	echo \"\$0 | \$startgreen | \$stopred | \$faronruntime \" >> ~/.falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN


## END
stopwatchtime
" >> $newbin/$proofreadfile
subl $newbin/$proofreadfile
stopwatchtime
