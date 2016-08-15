#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN

 SR="route add "
 IF=`/home/users/faron/.falcon/scripts/newbin/ff.network.devices.sh | sed '/lo/d' | sed '/:/d'`
 HR="0.0.0.0"
 SRi="if up route add "

NT="$1"
GW="$2"

echo -n -e "$Fstatus Create script for (a)uto or (s)ystem?"
read JOB

if [[ "$JOB" = "a" ]]; then
	


FILE="/tmp/routesbuilding.txt"
FILEa="/tmp/routesifup.txt"
echo "#!/bin/bash
source /usr/local/lib/faron_falcon/functions
loadSudo" > $FILE
> $FILEa

functionGetRoutes(){
if [[ ! "$NT" ]]; then

		echo -e -n "$Finfo Network: "
		read NT
		if [[ "$NT" == "" ]]; then
			cat $FILE
			cat $FILEa
			echo -e "$Fstatus File: $FILE"
			exit 0
		fi

#		GETHOST=`echo $NT  | cut -d'.' -f4 `
		BP="$2"; LP=":$3";
		if [[ "$2" = "" ]]; then BP="?";

		echo -e -n "$Finfo Port Forwarding $GETHOST "
		read BP
		fi
		# GETHOST=`echo "$NT:$BP$LP"`
		# #FIXIP=`echo $NT | sed "s/.$GETHOST//g" `

		# if [[ "$2" = "" ]]; then BP=""; fi
		# RST=`echo "$FIXIP.$GW" `

		# echo `echo sudo $SR $HR gw $RST $IF` >> $FILE;
 	# 	echo  `echo sudo $SR $NT gw $HR $IF` >> $FILE;
	 # 	echo  `echo sudo $SR $NT gw $RST $IF ` >> $FILE;

		# echo `echo $SRi $HR via $RST ` >> $FILEa;
 	# 	echo  `echo $SRi $NT via $HR ` >> $FILEa;
	 # 	echo  `echo $SRi $NT via $RST  ` >> $FILEa;
	 # 	sed -i -e "s/sudo/\$SUDO/g" $FILE
	 # 	NT=""; GW="";
	 # 	echo -e "$Fok"
	else
		echo -e "$Fstatus Done!"
	fi
functionGetRoutes

}

fi


if [[ "$JOB" = "s" ]]; then


functionLoadRoutes(){

if [[ ! "$NT" ]]; then

		echo -e -n "$Finfo Network: "
		read NT
		if [[ "$NT" == "" ]]; then
			echo -e "$Fno No route loaded"
			exit 0
		fi

#		GETHOST=`echo $NT  | cut -d'.' -f4 `
		BP="$2"; LP=":$3";
		if [[ "$2" = "" ]]; then BP="?";

		echo -e -n "$Finfo Port Forwarding $GETHOST "
		read BP
		fi

}

	
fi





################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

