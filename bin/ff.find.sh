#!/bin/bash
startgreen=`date +%s`

while :
do
    case "$1" in
    -f | --file)
		  	TYPEFILE=" -type f"
		  	FILE=$( echo $TYPEFILE )
		  	shift
		  	;;
    -d | --dir)
			TYPEDIR=" -type d"
		  	DIR=$( echo $TYPEDIR )
			shift
			;;
    -l | --level)
		  	DEPTHVAR=" -maxdepth $2"
		  	LEVEL=$(echo $DEPTHVAR )
		  	shift 2
		;;
    -n | --name)
			NAMESOVAR=$( echo $2 | sed 's/"/\"/g' )
			NAMESOVAR=$( echo NAMESOVAR | sed "s/'/\"/g" )
			NAMESOVAR=$( echo NAMESOVAR | sed 's/|/\{}/g' )
		  	NAMEVAR=" -name $NAMESOVAR"
		  	NAME=$(echo $NAMEFAR )
		  	shift 2
		;;
    -s | --search)
			SNAMESOVAR1=$( echo $2 | sed 's/"/\"/g' )
			SNAMESOVAR1=$( echo SNAMESOVAR1 | sed "s/'/\"/g" )
#			NAMESOVAR1=$( echo NAMESOVAR1 | sed 's/|/\{}/g' )
		  	SNAMESVAR1=" -name $SNAMESOVAR1"
		  	SNAME=$(echo $SNAMESVAR1 )
#			SEARCHVAR=" -name \"*$2*\""
#			SEARCH=$( echo $SEARCHVAR )
			shift 2
		;;
    -e | --exec )
			ISOVAR=$( echo $2 | sed 's/"/\"/g' )
			ISOVAR=$( echo ISOVAR | sed "s/'/\"/g" )
			ISOVAR=$( echo ISOVAR | sed 's/|/\{}/g' )
			EXECVAR=" -exec $ISOVAR \;"
			EXEC=" -exec \"$EXECVAR\""
			shift 2
		;;
    -x | --enclude-dir)
			PATHVAR=" -path \"*/$2/*\""
			PATHFOLDER=$( echo $PATHVAR )
			shift 2
		;;
	-w | --pwd)
			#OCVAR=$( echo $2 )
			LOCPA=$( echo $2 )
			shift 2
		;;
	-c | --cust)
			CUSTVAR=$( echo $2 | sed 's/"/\"/g' )
			CUST=$( echo $CUSTVAR )
			shift 2
		;;
	-g | --grep)
			GREPVAR=$(  )

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
CMDLINE=$( `find $LOCPA $LEVEL $DIR $FILE $NAME $SEARCH $PATHFOLDER $EXEC $CUST` )

if [ "$EUID" = 1004 ] || [ "$EUID" == 1000 ]; then
	find $LOCPA $DEPTH $DIR $FILE $NAME $SEARCH $PATHFOLDER $EXEC $CUST
fi
if [ "$EUID" = 0 ]; then
	sh -c find $LOCPA $DEPTH $DIR $FILE $NAME $SEARCH $EXEC $PATHFOLDER $CUST

fi

