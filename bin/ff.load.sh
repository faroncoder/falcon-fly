#!/bin/bash
FIL0="$1"
FIL1=`basename $FIL0`
FIL2=`echo $FIL1 | sed 's/.sh//g' `

find -L /home/faron/.bin -maxdepth 1 -name "*$FIL2*" -exec rm {} \;
ln -s "$PWD/$FIL0" "/home/faron/.bin/$FIL2"
echo "FALCON: Symlink created for $FIL1 => $FIL2"
exit 0
