
#!/bin/bash -e
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcm="OK";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ ! "$1" ]; then
#################### BEGIN
SELECT=""
while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    echo "[ n=new page | s=status | j=JSC build | p=new plugin | x=exit ]"
    #echo "Press <Enter> to do foo"
    #echo "Press <Space> to do bar"
    #read -s -N 1 SELECT
    IFS= read -s -n 1 SELECT
 	echo "Current cmd: $SELECT"
 	case "$SELECT" in
 		v) ./ff.generate.html.video.sh break ;;
		x) echo "exiting spawner"; break ;;
		*) break;;
	esac


done



echo "[$fcg$fcm$fco]"

################### END
#cd $RETURN
#else fcm="Arg 1"; echo "[$fcg$fcm$fco]"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

