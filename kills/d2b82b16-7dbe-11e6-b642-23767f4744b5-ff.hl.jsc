#!/bin/bash
startgreen=`date +%s`

#cmdthis="find $DEPTH $TYPE $NAME $EXEC"

while :
do
    case "$1" in
    -css)
		  	ff.hl.cssglop
		  	shift
		  	;;
    -js)
			ff.hl.jsglop
			shift
			;;
    -jsc)
		  	ff.hl.cssglop
		  	ff.hl.jsglop
		  	stopwatchtime
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

