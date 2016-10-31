#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
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
if [[ ! \"\$( echo \$PATH | grep 'source /usr/local/bin' )\" ]]; then export PATH=\$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors;  source /usr/local/lib/faron_falcon/functions;
if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.script.new-broken.sh  [ACTIVE] y

