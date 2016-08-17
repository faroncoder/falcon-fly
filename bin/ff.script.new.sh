#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LOC=/usr/local/lib/faron_falcon; . $LOC/colors; . $LOC/functions;
if [[ "$1" != "" ]]; then
#################### BEGIN
xcv="$1"
xcs="$2"
CL=$( basename "$xcv" )

if [[ "$CL" == "" ]]; then
	echo -n -e "$Finfo name of the script? "
	read CL
fi
if [[ "$xcs" == "" ]]; then
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
. /usr/local/lib/faron_falcon/colors; . /usr/local/lib/faron_falcon/functions;
if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN


################### END
#cd \$RETURN 1> /dev/null;
else echo -e \"\$Fstatus \$Fred Arg 1 \$Foff=\$Fyellow explain argments before calling. \$Foff\"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y
"  > "$MEF"
echo -e "$Fstat $Fblue $XF $Fgreen created. $Foff"
subl "$MEF"
################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstatus $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/bin/ff.new.script  [ACTIVE] y