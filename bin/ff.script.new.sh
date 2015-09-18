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
#elif [ \"\$1\" = '' ];
#	then
#  echo \"usage: $newfile \"
#  echo \"example:    \"
#fi


## TALON: $newfile
XeF

" >> $newbin/$proofreadfile
<<<<<<< HEAD
gedit $newbin/$proofreadfile
=======

##DETERMINING WHICH APP TO OPEN THE SCRIPT DEPENEDING ON WHICH SERVERS

SRVNAME=`hostname --short`

if [ "$SRVNAME" != 'f10' ]; then
	nano $newbin/$proofreadfile

else
	gedit $newbin/$proofreadfile
fi
>>>>>>> 565fe9fb368c95cec4c83016206e21fad0b1a331

exit 0
