#!/bin/bash
newfile="$1"
newbin="$HOME/.falcon/scripts/falcon-fly/newbin"
if [ -z "$1" ]; then
	echo -n "name of new file? "
	read newfile
fi
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
touch $newbin/$proofreadfile
chmod +x $newbin/$proofreadfile
echo "#!/bin/bash
if [ \"\$( echo \$PATH | grep '/home/faron/.bin/' )\" = '' ]; then
	export PATH=\$PATH:/home/faron/.bin:/usr/local/bin
fi
XeB=\`date +%s\`
function XeF {
XeE=\`date +%s\`; XeT=\$( echo \"\$(( \$XeB - \$XeE ))\" ); echo \"\$0 | \$XeB | \$XeE | \$XeT \" >> ~/.falcon/logs/scripts.log; exit 0 
}

#if [ \"\$1\" != \"\" ]; then
#################### BEGIN

## FUNCTIONS

## SCRIPTING


################### END
#elif [ \"\$1\" = \"\" ];
#	then
#  echo \"usage: $newfile \"
#  echo \"example:    \"
#fi


## TALON: $newfile
XeF

" >> $newbin/$proofreadfile
gedit $newbin/$proofreadfile

exit 0
