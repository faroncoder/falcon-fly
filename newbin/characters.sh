#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}


#################### BEGIN
source $HOME//.bash_colors

for i in {201..277}
do
	THIS=`echo $i | sed '/[0-9][0-9][8-9]/d'`;
	if [ "$THIS" != '' ]; then
	printf "$Green\342\230\\$i \n"
	fi
done


################### END


stopwatchtime
## TALON: characters


