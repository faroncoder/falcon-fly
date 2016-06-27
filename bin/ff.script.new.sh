#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo; loadEditor;
#if [[ "$1" != "" ]]; then
#################### BEGIN
newfile="$1"
newfolder="$2"
arbin="/mnt/falcon/archives"
if [[ "$1" == "" ]]; then
		echo -e -n "$Fstat name of script ? ";
		read newfile;
	else
		echo -e "$Fno name of script required.";
		logger "FALCON --> $( basename $0 ): DEBUG: Error 1 - name of script required"
		exit 1;
fi
if [[ "$2" == "" ]]; then
		echo -e -n "$Fstat which folder? ";
		read newfolder;
	else
		echo -e "$Fno name of folder required.";
		logger "FALCON --> $( basename $0 ): DEBUG: Error 2 - name of folder required"
		exit 2;
fi
newbin="/mnt/falcon/scripts/$newfolder"
proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
if [ -f "$newbin/$proofreadfile" ]; then
	echo -e "$Finfo moving old script to archives.$Foff"
	GETNA="$( uuid | cut -d'-' -f5 )"
	mv "$newbin/$proofreadfile" "$arbin/$GETNA_proofreadfile"
fi
touch "$newbin/$proofreadfile"
chmod +x "$newbin/$proofreadfile"
echo "#!/bin/bash
if [[ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]]; then export PATH=\$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=\$PWD;
if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##

echo -e \$Fok\"\$Fyellow \$( basename \$0 ) \$Foff\"

################### END
#cd \$RETURN 1> /dev/null
else echo -e \"\$Fwarn Arg 1:\$Fyellow name of arg \$Foff \\n\$Fwarn Arg 2: \$Fyellow name of arg \$Foff\"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=\$( basename \$0 ) active=y
"  >> "$newbin/$proofreadfile"
echo -e "$Fok $Fteal $proofreadfile $Foff created."
$EDITOR "$newbin/$proofreadfile" 2> /dev/null < /dev/null
################### END
#else echo -e "$Fwarn Arg 1:$Fyellow name of new script. $Foff \n$Fwarn Arg 2: $Fyellow name of bin you want to put script in $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y
