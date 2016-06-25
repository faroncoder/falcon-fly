#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
<<<<<<< HEAD
source /usr/local/lib/faron_falcon/colors
source /usr/local/lib/faron_falcon/functions
=======
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}

>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
newfile="$1"
newbin="/mnt/falcon/scripts/newbin"
arbin="/mnt/falcon/scripts/archivebin"
if [ -z "$1" ]; then
	echo -n "name of new file? "
	read newfile
fi
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
if [ -f "$newbin/$proofreadfile" ]; then
	GETNA="$( uuid | cut -d'-' -f5 )"
	mv "$newbin/$proofreadfile" "$arbin/$GETNA_proofreadfile"
fi
touch "$newbin/$proofreadfile"
chmod +x "$newbin/$proofreadfile"

<<<<<<< HEAD
echo "#!/bin/bash
RETURN=\$PWD
if [ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]; then export PATH=\$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
=======
echo "
#!/bin/bash
RETURN=\$PWD
if [ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]; then export PATH=\$PATH:/usr/local/bin; fi
fcbk=\"\$(tput setaf 0)\"; fcr=\"\$(tput setaf 1)\"; fcg=\"\$(tput setaf 2)\"; fcy=\"\$(tput setaf 3)\"; fcb=\"\$(tput setaf 4)\"; fcp=\"\$(tput setaf 5)\"; fcc=\"\$(tput setaf 6)\"; fcw=\"\$(tput setaf 7)\"; fco=\"\$(tput sgr0)\"; fcok=\"[\$fcg OK \$fco]\"; fcer=\"[\$fcr ERR \$fco]\";
XeB=\`date +%s\`
function XeF {
XeE=\`date +%s\`; XeT=\$( echo \"\$(( \$XeB - \$XeE ))\" ); logger \"\$0 | \$XeB | \$XeE | \$XeT \"; exit 0
}
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN


<<<<<<< HEAD
echo -e \$Fok\"\$Fyellow \$( basename \$0 ) \$Foff\"

################### END
#cd \$RETURN
else echo -e \$Finfo \"Arg 1=\$Fyellow empty \$Foff \"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=\$( basename \$0 ) active=y
"  >> "$newbin/$proofreadfile"
$Fok
echo -e "$Fblue $proofreadfile $Fgreen created. $Foff"
subl "$newbin/$proofreadfile" 2> /dev/null
=======
echo -e \"\$fcok \$fcy\$( basename \$0 )\$fco\"

################### END
#cd \$RETURN
else echo -e \"\$fcer Arg 1=\$fcy empty\$fco\"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y
"  >> "$newbin/$proofreadfile"
echo -e $fcok "$newbin/$proofreadfile"

>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
################### END
#cd $RETURN
#else echo -e "$fcer Arg 1=$fcy domain to search $fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

