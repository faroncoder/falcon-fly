#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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


