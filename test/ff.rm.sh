#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

if [ "$1" != \'x\' ]; then
#################### BEGIN
mkdir /tmp/trash -p
FOLDERSEND="/tmp/trash/"
if [ ! -d "$FOLDERSEND" ];
	then
	mkdir -p $FOLDERSEND
fi
if [ -f "$1" ];
	then
		mv $1 $FOLDERSEND
		echo "$1 trashed"
	fi
fi


################### END
elif [ "$1" = \'help\' ] || [ "$1" = \'\' ]; then
  echo "usage:"
  echo "ff.rm"
  echo "example:    "
fi

stopwatchtime
## TALON: ff.rm


