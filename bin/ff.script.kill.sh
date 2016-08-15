#!/bin/bash
<<<<<<< HEAD
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
=======
<<<<<<< HEAD
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
if [[ "$1" != "" ]]; then
#################### BEGIN


GI=`basename $1`
GIF="$PWD/$GI"
jj=$( uuid );
ji=`printf $jj | cut -d '-' -f 4`
mv $PWD/$1 /home/users/faron/.falcon/scripts/kills/$jj-$GI
<<<<<<< HEAD
#mv "$XD/$XF" "$XD/old-$ji-$XF";
=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
echo -e "$Fstat $1 killed."

################### END
#cd $RETURN 1> /dev/null;
<<<<<<< HEAD
else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
=======
else echo -e "$Finfo Arg 1=$Fyellow empty $Foff "; fi
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y
<<<<<<< HEAD
=======
=======

mv $1 /mnt/falcon/archives/killed/

exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

