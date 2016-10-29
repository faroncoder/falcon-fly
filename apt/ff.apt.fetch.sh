RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
if [[ "$1" != "" ]]; then
#################### BEGIN

PICKS=( $@ )

for j in "${PICKS[@]}"; do
		/usr/local/bin/ff.apt.build $j
		sudo apt-get install -y $j --force-yes 2> /dev/null;
		j=""
done




################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "$Fyellow enter keyword to search the repository $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

