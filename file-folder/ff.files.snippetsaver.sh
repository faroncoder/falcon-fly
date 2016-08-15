#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '' ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

<<<<<<< HEAD
HUNTFILE=( `find -L /home/users/faron/.falcon/code/sublime/User -maxdepth 1 -type f -name '*-snippet'  `  )
=======
HUNTFILE=( `find -L /mnt/falcon/code/sublime/User -maxdepth 1 -type f -name '*-snippet'  `  )
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
if [[ ! -z "$HUNTFILE" ]]; then
        for snippet in "${HUNTFILE[@]}"; do
        	FILEME=$( basename $snippet )
        	logger "Found: $FILE and moving to resident folder"
<<<<<<< HEAD
        	mv $snippet /home/users/faron/.falcon/code/sublime/mysnippets/
        	CHECKME=$( ls -al /home/users/faron/.falcon/code/sublime/mysnippets/$FILEME )
=======
        	mv $snippet /mnt/falcon/code/sublime/mysnippets/
        	CHECKME=$( ls -al /mnt/falcon/code/sublime/mysnippets/$FILEME )
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
        	if [[ ! -z "$FILEME" ]]; then
        		echo "$FILEME secured."
        	fi
        	ff.notify.echo "Found: $( basename $snippet )" < /dev/null
        done
fi


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage:  "
#  echo "example:    "
#fi
## TALON:
XeF
