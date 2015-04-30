#!/bin/bash
newfile="$1"
newbin="$HOME/.falcon/scripting/faron-scriptor/newbin"
if [ -z "$1" ]
	then
	echo -n "name of new file? "
	read newfile
fi
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
touch $newbin/$proofreadfile
chmod +x $newbin/$proofreadfile
echo "#!/bin/bash


exit 0
" >> $newbin/$proofreadfile
subl $newbin/$proofreadfile

exit 0
