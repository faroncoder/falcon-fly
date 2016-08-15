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

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
