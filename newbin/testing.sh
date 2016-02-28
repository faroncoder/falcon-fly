
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

echo "${@:3}" >> ./txt.txt

input="./txt.txt"
while IFS= read -r line
do
    cut -d ' ' -f3- <<<"$line" >> build.txt
    ### same stuff with awk ###
    ### awk '{print substr($0, index($0,$3))}' <<< "$line" ###
done < "${input}"

# arrazingEntries(){  

# 	KEYTHIS="\"$( echo ${UPDATE[@]} | awk '{print $1}' )\""
# 	VALTHIS="\"$( echo ${UPDATE[@]} | awk '{print $2}' )\""
# 	#echo -e "$fcok $fcc {\"$KEYTHIS\":\"$VALTHIS\"} $fco"
# 	echo "$KEYTHIS:$VALTHIS"
# 	#echo $ENTRY
# 	#QUERY=( $QUERY $ENTRY )
# 	#UPDATE=( $( echo ${ARG[@]} | awk '{print substr($0, index($0,$3))}' ) )
# 	#UPDATE="$( echo "${THIS[@]}" | awk '{print substr($0, index($0,$3) ) }'  )"
# 	UPDATE=( `echo "$THIS" | awk '{print substr($0, index($0,$3) ) }' ` )
# 	if [[ "${UPDATE[@]}" != "" ]]; then
# 			arrazingEntries
# 	fi
# }


# arrazingEntries

# echo ${THIS}
	#UPDATE=( $( echo "$[UPDATER[@]}" ) 




# for j in "${QUERY[@]}"; do
# 	echo $j
# done
# while [[ "${ARG[@]}" != "" ]]; do
#    echo ${ARG[@]} | awk '{ print $1 $2 }' > here.txt
#    ARG=( `echo ${ARG[@]:3}` )
# done


# echo ${ARG[@]} | awk '{print "{\""$1"\":\""$2"\"}"'

# #for string in "${ARG[@]}"; do 
# 	echo ${ARG[@]} | awk '{print $1" "$2}'
# 	ARG=( `echo ${ARG:3}` )
# 	ARG=$UPDATEARG
# 	KEY=$string
# 	VAL=$( echo ${ARG[@]} | sed "s/${ARG[@]:1:0}//g" )
# 	THIS="$( echo "{\"$N_$KEY\":\"$VAL\"}" )"
# 	if [[ "$COLL" != "" ]]; then
# 		COLL="$COLL,$THIS"
# 	else
# 		COLL="$THIS"
# 	fi
# 	UPDATEARG=$( echo ${ARG[@]} | sed "s/$( echo ${ARG[@]:1:0} )//g" | sed "s/$( echo ${ARG[@]:1:0} )//g"  )
# 	echo ${UPDATEARG[@]}
# 	echo ${COLL[@]}
# 	N="$( echo $(( $N + 1 )) )"
# done


# echo ${ARG[@]} 
# echo "$KEY$N"
# VAL="$( echo ${string[@]} | cut -d" " -f1; )"
# ARG=$( echo ${ARG[@]} | sed "s/${ARG[@]:1:0}//g" )
# echo ${ARG[@]} 
# echo "$VAL$N"

	

# 	$string"

# KEY="$KEY$N";
# VAL="$VAL$0";

# echo ${ARG[@]} | cut -d" " -f1


# echo "${ARG[@]}" > /tmp/a.txt
# echo "${ARG[@]}" > /tmp/aa.txt
	
# 	# 		echo ${line:1:0} >> /tmp/c.txt
# 	# 		sed 's/${line:1:0}//g' /tmp/a.txt
# 	# 		echo ${line:2:0} >> /tmp/d.txt
# 	# 		sed 's/${line:2:0}//g' /tmp/a.txt
# 	# done < /tmp/a.txt

# echo -e "$fcok DATABASE=$1"
# echo -e "$fcok TABLE=$2"

# ARG=$( echo ${ARG[@]} | sed "s/${ARG[@]:1:0}//g" )
# echo ${ARG[@]} | tr ' ' '\n'





# for j in "${ARG[@]}"; do
# 	case ${ARG[@]}


#ARG=( $( echo ${@:3} | sed "s/$( echo ${ARG[@]:1:0})/$( echo "${ARG[@]:1:0}|" )/g" ) )
#LIST=$( echo   )
#TOT=$( echo  "${ARG[@]}" | wc -w )
#echo $ARG
#echo $LIST
#echo $TOT

# while :
# 	do
# 	case "$ARG" in
# 		0)
# 			echo -e "$fcok $3 : $4"; shift 2; break; ;;
# 		*) break; ;;
# 	esac
# done


# while :
# 	do
# 		case "${ARG}" in 
			
# 			"${ARG}") echo -e "$fcok $1:$2"; shift 2; ;;
# 			*) echo -e "$fcok no more populatings"; break; ;;
# 		#echo "$1=$2"; shift 2;  break; ;;
# 		# case "${ARG}" in
			
# 			# "") break; ;; 
# 		esac
# done

# for sring in "${THIS[@]}"; do
# 	echo -e "$fcok $sring"
# done

# 				N=0
# 				N=$( echo $(( $N + 1 )) )
# 				if [[ "$4" == "" ]]; then
# 				echo -e "$fcer no entry for $3";
# 				exit 1;
# 			else
# 				if [[ "$SRING" != "" ]]; then
# 					SRING="$SRING,\"$3\":\"$4\""
# 					shift 2;
# 				else
# 					SRING="\"$1\":\"$2\"";
# 					shift 2;
# 				fi	
# 			fi
# 			break;
# 			;;
# 	esac
# done

# echo -e "$fcok $1"
# echo -e "$fcok $2"
#echo -e "$fcok $SRING"
#echo "${UPDATE[@]}" | awk '{print substr($0, index($0,$3) ) }'

#echo -e "$fcok $fcy$( basename $0 )$fco"

################### END
#cd $RETURN
else echo -e "$fcer Arg 1=$fcy empty$fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

