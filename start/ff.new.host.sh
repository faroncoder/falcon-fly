#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
GET=$1; if [[ "$1" == "" ]]; then
#################### BEGIN
echo -e -n "$Fstat domain? "
read -e GET
fi
			 								
#### GET										
### subdomain.example.com/abc/def

GETACTU=`echo $GET | tr '/' ' '`				
### subdomain.example.com abc def

GETRIM=`echo $GETACTU | awk '{print $1}'` 
### subdomain.example.com

CHECKDOM=`echo $GETRIM | rev | tr '.' ' '`  	
### moc example niamodbus

EXTRACT=`echo $CHECKDOM | awk '{ print $1"."$2 }'`  
### moc.elpmaxe

DOMAIN=` echo $EXTRACT | rev  | tr ' ' '.'` 	
### example.com

HOSTFET=`hostname -s ` 					      	
### UNIX to grab host name of this computer

ASKDOMAIN="$HOSTFET.$DOMAIN"					
### host.example.com
#### whatever user input is, we only focus on grabbing the domain only and use this host
#### name that it was orginally built with, and we use that name to go with domain name
#### otherwise this host wouldn't be able to connect to the WAN as host with public ip.

#### NOTE: this is kinda of overkill but, a bulletproof on getting domain on first script run.

goAndSetupSystem(){
	$SUDO ypdomainname --boot $DOMAIN
	echo -e "$Fwarn ypdomainname set for $DOMAIN"   			## UNIX command
	$SUDO nisdomainname --boot $DOMAIN 	 					## UNIX command
	echo -e "$Fwarn nisdomainname set for $DOMAIN"   			## UNIX command
	$SUDO sh -c "echo \"$ASKDOMAIN\" >> /etc/hostname"    	## UNIX writes new name to /etc/hostname
	echo -e "$Fwarn configuring /etc/hostname"
	echo -e "$Fok $ASKDOMAIN configured"					## output  as confirmed
}



echo -e -n "$Finfo proceed setting up as $ASKDOMAIN? (y/Y)"
GOAHEAD=""  											### filter <return> key or <space bar> out
while [[ "$GOAHEAD" != $"\x0a" && "$GOAHEAD" != $"\x20" ]]; do
    #read -s -N 1 GOAHEAD
    IFS= read -s -n 1 GOAHEAD							### grab user input but on one keystroke
 	echo -e "\n$Fstat your response: $GOAHEAD" 			### confirming user entered as yes
 	case "$GOAHEAD" in
 		y) goAndSetupSystem; break ;;					### if Y or y then fire the command and exit
		Y) goAndSetupSystem; break ;;
		*) echo -e "Fwarn exiting"; break;;
	esac
done


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow enter domain name to set up with $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


