#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN


newfile="$1"

arbin="/mnt/falcon/archive/kills"
if [ -z "$1" ]; then
	echo -n -e "$Finfo name of new file? "
	read newfile
fi
if [ -z "$2" ]; then
	echo -n -e "$Finfo which folder? "
	read newfolder
	newbin="/mnt/falcon/scripts/$newfolder"
fi


proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
if [ -f "$newbin/$proofreadfile" ]; then
	GETNA="$( uuid | cut -d'-' -f5 )"
	echo -e "$Finfo Archiving old script"
	mv "$newbin/$proofreadfile" "$arbin/$GETNA.proofreadfile"
fi
touch "$newbin/$proofreadfile"
chmod +x "$newbin/$proofreadfile"

echo "
#!/bin/bash
if [[ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]]; then export PATH=\$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=\$PWD;
#if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##

#echo -e \"\$Fok\$Fyellow \$( basename \$0 ) \$Foff\"


################### END
#cd \$RETURN 1> /dev/null
#else echo -e \"\$Fwarn Arg 1:\$Fyellow name of arg \$Foff \n\$Fwarn Arg 2: \$Fyellow name of arg \$Foff\"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=\$( basename \$0 ) active=y
"  >> "$newbin/$proofreadfile"
echo -e  "$Fok $newbin/$proofreadfile"

if [[ "$( hostname -s )" == "f10" ]];
	then
	subl $newbin/$proofreadfile
else
	nano $newbin/$proofreadfile
fi
################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

