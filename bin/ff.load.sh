#!/bin/bash
FIL0="$1"
FIL1=`basename $FIL0`
FIL2=`echo $FIL1 | sed 's/.sh//g' `
BINHOME="~/.bin"
WHICHUSER=$( echo $PWD | cut -d"/" -f 3 )
if [[ $WHICHUSER = 'fly' ]]; then
	BINHOME="~/.falcon/bin"
	echo "Hello fly!"
fi
find -L $BINHOME -maxdepth 1 -name "*$FIL2*" -exec echo {} \;
ln -s "$PWD/$FIL0" "$BINHOME/$FIL2"
echo "FALCON: Symlink created for $FIL1 => $FIL2"
exit 0
