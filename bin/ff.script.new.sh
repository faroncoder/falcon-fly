#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors
source /usr/local/lib/faron_falcon/functions
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

echo "#!/bin/bash
RETURN=\$PWD
if [ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]; then export PATH=\$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN


echo -e \$Fok\"\$Fyellow \$( basename \$0 ) \$Foff\"

################### END
#cd \$RETURN
else echo -e \$Finfo \"Arg 1=\$Fyellow empty \$Foff \"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=\$( basename \$0 ) active=y
"  >> "$newbin/$proofreadfile"
echo -e $Fok
echo -e "$Fblue $proofreadfile $Fgreen created. $Foff"
subl "$newbin/$proofreadfile" 2> /dev/null
################### END
#cd $RETURN
#else echo -e "$fcer Arg 1=$fcy domain to search $fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

