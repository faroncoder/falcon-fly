#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#################### BEGIN

if [[ "$1" == "" ]]; then
	echo -n "$Finfo script name? "
	read CL
fi
if [[ "$2" == "" ]]; then
	echo -n "$Finfo folder? "
	read xcs
fi
CL=$1
xcs=$2
arumentsInstall(){
echo -n "$Finfo Script response when no arguments is entered?  "
		read Descript
		LOADDes="$Descript"
		INTERACT="if [[ \"\$1\" != \"\" ]]; then"
		ENDINTERACT="else echo \"\$Fno \$Fred no argument is supplied.\$Foff\""
		LOADIN="echo \"\$Finfo \$Fyellow `echo $LOADDes` as an argument \$Foff\"; fi"
}

if [[ "$3" == "y" ]]; then
	arumentsInstall
elif  [[ "$3" == "" ]]; then
	echo -n "$Fwarn script to interact with user? (y=yes) "
	read interactive
	if [[ "$interactive" == "y" ]]; then
		arumentsInstall
	fi
elif [[ "$3" == "n" ]]; then
	INTERACT=""
	ENDINTERACT=""
	LOADIN=""
fi

pointofreturninstall(){
	LOADHOME="RETURN=\$PWD"
	LANDHOME="cd  \$RETURN 1> /dev/null 2> /dev/null;"
}

if [[ "$4" == "y" ]]; then
	pointofreturninstall
elif  [[ "$4" == "" ]]; then
	echo -n "$Finfo return to current CWD?  "
	read ENTRYRETURN
	if [[ "$ENTRYRETURN" == "y" ]]; then
		pointofreturninstall
	fi
elif [[ "$4" == "n" ]]; then
	LOADHOME=""
	LANDHOME=""
fi

HEADER="#!/bin/bash
$LOADHOME
if [[ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]]; then export PATH=\$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
$INTERACT
#################### BEGIN
"
FOOTER="################### END
$ENDINTERACT
$LOADIN
$LANDHOME
XeF  ### exit code for clean exit
### [ FILE:\$MEF ACTIVE:y ]

"
LYH="/home/users/faron/.falcon/scripts"
XF="$( echo $CL | tr '  ' ' ' | sed 's/.sh//g' ).sh"
MEF="$LYH/$2/$XF"
jj=$( uuid );
ji=`printf $jj | cut -d '-' -f 4`
KIL="$LYH/kills/$ji-killed-$XF"
if [[ -f "$MEF" ]]; then
	echo "$Fwarn filename exists."
	XeF
else
	> $MEF
	chmod +x $MEF

echo -e "$HEADER" | sed '/^$/d' > "$MEF"
echo -e " your script goes here
echo \"\$Fstat\"
echo \"\$Fno\"
echo \"\$Fwarn\"
echo \"\$Finfo\"
echo \"\$Fok\"" >> "$MEF"
echo -e "$FOOTER"   | sed '/^$/d' >> "$MEF"


echo "$Fstat $Fblue $XF $Fgreen created $Foff"

fi
ff.load
SERVER=`hostname -s`
if [[ "$SERVER" == "f8" ]]; then
	EDIT="subl"
else
	EDIT="nano"
fi
$EDIT $MEF

################### END
XeF  ### exit code for clean exit
### [FILE:ff.script.new ACTIVE:y
