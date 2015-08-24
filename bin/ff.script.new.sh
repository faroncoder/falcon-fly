
#!/bin/bash
newfile="$1"
newbin="$HOME/.falcon/scripting/falcon-fly/newbin"
if [ -z "$1" ]
	then
	echo -n "name of new file? "
	read newfile
fi
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
touch $newbin/$proofreadfile
chmod +x $newbin/$proofreadfile
echo "#!/bin/bash
if [ \"\$( echo \$PATH | grep '/home/faron/.bin/' )\" = '']; then
	export PATH=\"\$PATH:/home/faron/.bin:/home/local/bin\"
fi
startgreen=\`date +%s\`
stopwatchtime() {
	stopred=\`date +%s\`
	faronruntime=\$( echo \"\$(( \$startgreen - \$stopred ))\" );
	echo \"\$0 | \$startgreen | \$stopred | \$faronruntime \" >> ~/.falcon/logs/scripts.log;
	exit 0
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

stopwatchtime
## TALON: $newfile

" >> $newbin/$proofreadfile
subl $newbin/$proofreadfile

exit 0
