
#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
if [[ "$1" != "" ]]; then
#################### BEGIN
DATABASE=$1
TABLE=$2
ARG=$( ${@:3} )
echo $ARG

DATABASE=$1
TABLE=$2
ARG="${@:3}"



while :
	do
	case "${ARG}" in
		$ARG) 
			if [[ "$2" == "" ]]; then
				echo -e "$fcer no entry for $1";
				exit 1;
				break;
			else
				if [[ "$SRING" != "" ]]; then
					SRING="$SRING,\"$1\":\"$2\""
					shift 2
				else
					SRING="\"$1\":\"$2\"";
					shift 2;
				fi	
			fi
			;;
	esac
done

echo -e "$fcok $DATABASE"
echo -e "$fcok $TABLE"
echo -e "$fcok $SRING"

# while :
# 	do
# 	case "$3" in
# 	$3)	
# 			if [[ "$4" != "" ]]; then  SRING="\"$1\":\"$2\""; fi;  shift 2 ;;

# 		# $1)

# 		# 	if [[ "$1" == "" ]]; then break; else SRING="$SRING, \"$1\":\"$2\""; shift 2 ;; fi
# 		*) 		echo -e "$fcer name of object can't be empty"
# 				break; exit 1 ;;

# 		--)  	echo -e "$fcer name of object can't be empty"; break; exit 2;;
# 	esac
# done



#for j in ${GET[@]}; do echo -e "db.$2.insert({ \"name\":\"$j\" })" | mongo $1 --silent; echo -e "$fcok: $j" done



################### END
#cd $RETURN
else echo -e "$fcer Arg 1=$fcy database name $fco"; echo -e "$fcer Arg 2=$fcy collection $fco" ; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

