#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

CMD="db.$2.find();"

# while :
# do
#     case "$1" in
#   	-f)
# 			FDL="$FDL,$2:1"
# 			CMD="db.$1.find({},{ $FDL });"
# 			shift 2
# 	;;
#        --) # End of all options
# 	 	shift
# 	  	break
# 	  ;;
#       -*)
# 	  	echo "Error: Unknown option: $1" >&2
# 	  	exit 1
# 	  ;;
#       *)  # No more options
# 	  	break
# 	  ;;
#     esac
# done



echo "$CMD" | mongo $1 --quiet
#mongo $1 "/tmp/mongo.dat"
## place your script here
#> /tmp/mongo.dat
fi

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] fm.find.sh  [ACTIVE] y

