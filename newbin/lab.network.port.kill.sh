#!/bin/bash
if [ "" = '' ]; then
	export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/home/faron/bin:/usr/local/bin:/usr/local/sbin:/usr/lib/jvm/java-8-oracle/bin:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=; logger "/usr/local/bin/ff.script.new |  |  |  "; exit 0
}
#if [ "" != "" ]; then
#################### BEGIN
################### END
#elif [ "" = '' ];
#	then
#  echo "usage:  "
#  echo "example:    "
#fi
## TALON:
XeF

#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$((  -  ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage:  "
#  echo "example:    "
#fi
## TALON:
XeF

