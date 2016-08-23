RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
if [[ "$1" != "" ]]; then
#################### BEGIN

PICKS=( $@ )

for j in "${PICKS[@]}"; do

	#CHECKDPKG=`dpkg-query --show --showformat='${db:Status-Status}' "$j"` 2> /dev/null;
	#sudo rm /var/lib/dpkg/lock; sudo dpkg --configure -a; 2> /dev/null;
	#if [[ "$CHECKDPKG" == "installed" ]]; then
	#	echo -e "$Fwarn skipping $j as its installed."
	#else
		/usr/local/bin/ff.apt.check $j
		/usr/local/bin/ff.apt.build $j
		sudo apt-get install -y $j --force-yes 2> /dev/null;
	#fi
	j=""
done




#appGo(){
#		logger "FARON:: apt-get package recorded for installation = $appget "
#		/usr/local/bin/ff.apt.build $appget
#		sudo apt-get install -y $appget --force-yes 2> /dev/null;
#		appget=""
#}


#APID="$( uuid )_f"



#	for appget in "${PACKS[@]}"; do
#		appGo
#	done




################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "$Fyellow enter keyword to search the repository $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

