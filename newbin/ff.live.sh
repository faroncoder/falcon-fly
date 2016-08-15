#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

<<<<<<< HEAD
LOCPN="/home/users/faron/.falcon/code/html/lib/live"
=======
<<<<<<< HEAD
LOCPN="/home/users/faron/.falcon/code/html/lib/live"
=======
LOCPN="/mnt/falcon/code/html/lib/live"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
source $LOCPN/functions.txt
source $LOCPN/templates.txt

SELECT=""
while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    echo -e "$Finfo (f)avicon : (s)tatus : (j)s update :  (n)ew page : s(t)ructure : e(x)it "
    #echo "Press <Enter> to do foo"
    #echo "Press <Space> to do bar"
    #read -s -N 1 SELECT
    IFS= read -s -n 1 SELECT
 	echo -e "$Farg $SELECT $Foff"
 	case "$SELECT" in
 		n) newhtml; shift ;;
		t) tree . -d -L 3; shift ;;
		f) newfavico; shift ;;
		j) jsglop; shift ;;
		c) cssglop; shift ;;
		p) getpages; shift ;;
		s) getStatus; shift ;;
		x) echo -e "$Fok html exit"; break ;;
		*) break;;
	esac


done


################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

