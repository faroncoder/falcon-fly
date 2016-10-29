
#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##
J="nameserver "; K="162.220"; L="64.68.198";
$SUDO sh -c "echo  \"$J $L.91\n$J $L.183\n$J $L.83\n$J 166.88.18.58\n$J $K.33.236\n$J $K.34.74\n\" > /etc/resolvconf/resolv.conf.d/head"
cat /etc/resolvconf/resolv.conf.d/head
echo -e $Fok
#echo -e "$Fok$Fyellow $( basename $0 ) $Foff"


################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

