#!/bin/bash
startgreen=`date +%s`
AB="$1"
CD="$2"
if [ -z "$AB" ]
	then
	echo -n "which folder to itemize? "
	read AB
fi
if [ -z "$CD" ]
	then
	echo -n "which folder to compare with? "
	read CD
fi

orderfile="$( find $AB -type f )"
orderfiles=( $orderfile )
comparefile="$( find "$CD" -type f )"
comparefiles( $comparefiles )
itemsfil="$( echo ${comparefiles[@]} )"
for file in "${orderfiles[@]}";
	do
		itemsfil="$( echo $itemsfil | sed "/\$file/d" )"
	done
echo $itemsfil

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
