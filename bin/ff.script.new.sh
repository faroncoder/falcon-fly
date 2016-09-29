#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN
xcv="$1"
xcs="$2"
interactive="$3"
if [[ -z "$interactive" ]]; then
	echo -n "$Fwarn script to interact with user? (y or n) "
	read interactive
	echo "$Fstat Enter short description explaining how to interact with the script:"
	read Descript
	LOADDes="$Descript"
	INTERACT="if [[ \"\$1\" != \"\" ]]; then"
	ENDINTERACT="else echo \"\$Fno \$Fred Arg 1 \$Foff=\$Fyellow $LOADDes \$Foff\"; fi"
fi
if [[ "$interactive" == "y" ]]; then
	echo "$Fstat Enter short description explaining how to interact with the script:"
	read Descript
	LOADDes="\"$Descript\""
	INTERACT="if [[ \"\$1\" != \"\" ]]; then"
	ENDINTERACT="else echo \"\$Fno \$Fred Arg 1 \$Foff=\$Fyellow $LOADDes \$Foff\"; fi"
else
	INTERACT=""
	ENDINTERACT=""
#	INTERACT="#if [[ \"\$1\" != \"\" ]]; then"
#	ENDINTERACT="#else echo \"\$Fno \$Fred Arg 1 \$Foff=\$Fyellow $Descript \$Foff\"; fi"
fi
#echo "$Fwarn script to be interacted: $interactive"

CL=`basename "$xcv"`

if [[ "$CL" == "" ]]; then
	echo -n -e "$Finfo name of the script? "
	read CL
fi
if [[ "$xcs" == "" ]]; then
	echo -n -e "$Finfo which folder? "
	read xcs
fi
if [[ "$interactive" == "" ]]; then
	echo -n -e "$Finfo which folder? "
	read xcs
fi
LYH="/home/users/faron/.falcon/scripts"
XF="$( echo $CL | tr '  ' ' ' | sed 's/.sh//g' ).sh"
MEF="$LYH/$xcs/$XF"
jj=$( uuid );
ji=`printf $jj | cut -d '-' -f 4`
KIL="$LYH/kills/$ji-killed-$XF"
#XD="/home/users/faron/.falcon/scripts/$xcs/$CL"
#MEF="$PWD/$XF"
if [[ -f "$MEF" ]]; then
	echo -e "$Fno filename exists."; XeF
fi


 #ji=$( uuid );
> $MEF
chmod +x $MEF

echo "#!/bin/bash
RETURN=\$PWD
if [[ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]]; then export PATH=\$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
$INTERACT
#################### BEGIN

echo \"\$Fstat\"
echo \"\$Fno\"
echo \"\$Fwarn\"
echo \"\$Finfo\"
echo \"\$Fok\"


################### END
#cd \$RETURN 1> /dev/null;
$ENDINTERACT
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $MEF [ACTIVE] y

" > "$MEF"
echo -e "$Fstat $Fblue $XF $Fgreen created. $Foff"
ff.load
subl "$MEF"

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstatus $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/bin/ff.script.new  [ACTIVE] y
