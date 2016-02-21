#!/bin/bash
newfile="$1"
newbin="/mnt/falcon/scripts/newbin"
if [ -z "$1" ]; then
	echo -n "name of new file? "
	read newfile
fi
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
touch $newbin/$proofreadfile
chmod +x $newbin/$proofreadfile
echo "#!/bin/bash
HERE=\$PWD
if [ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]; then
	export PATH=\$PATH:/usr/local/bin
fi
XeB=\`date +%s\`
function XeF {
XeE=\`date +%s\`; XeT=\$( echo \"\$(( \$XeB - \$XeE ))\" ); logger \"\$0 | \$XeB | \$XeE | \$XeT \"; exit 0
}
#if [ \"\$1\" != \"\" ]; then
#################### BEGIN


################### END
cd \$HERE
#elif [ \"\$1\" = '' ];
#	then
#  echo \"usage: $newfile \"
#  echo \"example:  $newfile  \"
#fi
## TALON:
XeF

" >> $newbin/$proofreadfile

#subl $newbin/$proofreadfile

###DETERMINING WHICH APP TO OPEN THE SCRIPT DEPENEDING ON WHICH SERVERS
##SRVNAME=`hostname --short`

#ln -s $newbin/$proofreadfile

 if [[ "$( hostname --short )" != "f10" ]]; then
 	nano $newbin/$proofreadfile
 else
 	subl $newbin/$proofreadfile
 fi

exit 0
