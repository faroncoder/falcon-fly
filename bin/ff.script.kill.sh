#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
if [[ "$1" != "" ]]; then
#################### BEGIN


GI=`basename $1`
GIF="$PWD/$GI"
jj=$( uuid );
ji=`printf $jj | cut -d '-' -f 4`
mv $PWD/$1 /home/users/faron/.falcon/scripts/kills/$jj-$GI
#mv "$XD/$XF" "$XD/old-$ji-$XF";
echo -e "$Fstat $1 killed."

################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

