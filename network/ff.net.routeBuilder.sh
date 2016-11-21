#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

 SR="route add "
 IF="enp1s5"
 HR="0.0.0.0"
 SRi="if up route add "


 IF="enp1s5"
 HR="0.0.0.0"


NT="$1"
GW="$2"
FILE="/tmp/routesbuilding.txt"
FILEa="/tmp/routesifup.txt"
echo "#!/bin/bash
source  /usr/local/lib/faron_falcon/functions
loadSudo" > $FILE
> $FILEa

functionGetRoutes(){
if [[ ! "$NT" ]]; then

		echo -e -n "_info Network: "
		read NT
		if [[ "$NT" == "" ]]; then
			cat $FILE
			cat $FILEa
			echo -e "$us File: $FILE"
			exit 0
		fi

#		GETHOST=`echo $NT  | cut -d'.' -f4 `
		BP="$2"; LP=":$3";
		if [[ "$2" = "" ]]; then BP="?";

		echo -e -n "_info Port Forwarding $GETHOST "
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
	 # 	echo -e "_ok"
	else
		echo -e "$us Done!"
	fi
functionGetRoutes

}



functionGetRoutes


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.routeBuilder.sh  [ACTIVE] y

