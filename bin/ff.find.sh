#!/bin/bash
startgreen=`date +%s`

#cmdthis="find $DEPTH $TYPE $NAME $EXEC"

while :
do
    case "$1" in
    -f | --file)
		  	TYPEFILE=" -type f ! -type d "
		  	FILE=$( echo $TYPEFILE )
		  	shift
		  	;;
    -d | --dir)
			TYPEDIR=" -type d ! -type f"
		  	DIR=$( echo $TYPEDIR )
			shift
			;;
    -l | --max)
		  	DEPTHVAR=" -maxdepth $2"
		  	DEPTH=$(echo $DEPTHVAR )
		  	shift 2
		;;
    -n | --name)
		  	NAMEVAR=" -name \"$2\""
		  	NAME=$(echo $NAMEFAR )
		  	shift 2
		;;
    -s | --search)
			SEARCHVAR=" -name \"*$2*\""
			SEARCH=$( echo $SEARCHVAR )
			shift 2
		;;
    -e | --exec )
			ISOVAR=$( echo $2 | sed 's/"/\"/g' )
			EXECVAR="$ISOVAR \{} \;"
			EXEC="-exec `echo $EXECVAR`"
			shift 2
		;;
    -p | --path)
			PATHVAR="-path '*/$2*'"
			PATHFOLDER=$( echo $PATHVAR )
			shift 2
		;;
	-w | --pwd)
			#OCVAR=$( echo $2 )
			LOCPA=$( echo $2 )
			shift 2
		;;
	-c | --cust)
			CUSTVAR=$( echo $2 | tr '"' '\"' )
			CUST=$( echo $CUSTVAR )
			shift 2
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

sudo sh -c "find $LOCPA $DEPTH $DIR $FILE $NAME $SEARCH $EXEC $PATHFOLDER $CUST"
