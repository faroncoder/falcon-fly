#!/bin/bash

cmdthis="find  $DEPTH $TYPE $NAME $EXEC"
LOCPA=""
DEPTH=""
TYPE=""
NAME=""
EXEC=""

while :
do
    case "$1" in
        -f)
		  	TYPEVAR="-type f"
		  	TYPE=$( echo $TYPEVAR )
		  	shift
		  	;;
	    -d)
			TYPEVAR="-type d"
		  	TYPE=$( echo $TYPEVAR )
			shift
			;;
		-l)
			if [ ! -z "$2" ]; then
		  		DEPTHVAR=". -maxdepth $2"
		  		DEPTH=$(echo $DEPTHVAR )
		  		shift 2
		  	fi
		;;
	  	-n)
			if [ ! -z "$2" ]; then
		  		NAMEVAR="-name \"*$2*\""
		  		NAME=$(echo $NAMEFAR )
		  		shift 2
		  	else
	  			echo "Error: $1 requires string as query for searching" >&2
		  		echo "SYSTEM: moving $2 as next argument"
		  		shift
		  	fi
		;;
	  --) # End of all options
	 	shift
	  	break
	  ;;
      -*)
	  	echo "Error: Unknown option: $1" >&2
	  	exit 1
	  ;;
      *)  # No more options
	  	break
	  ;;
    esac
done

find $LOCPA $DEPTH $TYPE $NAME $EXEC
