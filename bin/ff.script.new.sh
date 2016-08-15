#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
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
LYH="/mnt/falcon/scripts"
XF="$( echo $CL | tr '  ' ' ' | sed 's/.sh//g' ).sh"
MEF="$LYH/$xcs/$XF"
jj=$( uuid );
ji=`printf $jj | cut -d '-' -f 4`
KIL="$LYH/kills/$ji-killed-$XF"
#XD="/mnt/falcon/scripts/$xcs/$CL"
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
x=( colors functions ); for z in \"\${x[@]}\"; do source /usr/local/lib/faron_falcon/\$z; done
if [[ \"\$1\" != \"\" ]]; then
#################### BEGIN


echo -e \$Fok\"\$Fyellow \$( basename \$0 ) \$Foff\"

################### END
#cd \$RETURN 1> /dev/null;
else echo -e \$Finfo \"Arg 1=\$Fyellow empty \$Foff \"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=\$( basename \$0 ) active=y
"  > "$MEF"
echo -e "$Fstat $Fblue $XF $Fgreen created. $Foff"
subl "$MEF"
################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$fcer Arg 1=$fcy domain to search $fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

