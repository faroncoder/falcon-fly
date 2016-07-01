
#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [[ "$1" != "" ]]; then
#################### BEGIN


while :
do
    case "$1" in
      -f | --file)
		if [[ -f "$2" ]]; then
			xclip -in -sel clipboard "$2"   # You may want to check validity of $2
			echo -e "$Fstatus clip-boarded ( ctrl-v to paste )."
	  		shift 2
	  	fi
	;;
       *)		THISFILE=`uuid`
		SEL="/tmp/$THISFILE.txt"
	  	echo "$@" > $SEL
	  	xclip -sel clip < $SEL
	  	echo -e "$Fstatus clip-boarded ( ctrl-v to paste )."
	  	break;
	;;
      -h | --help)
			display_help  # Call your function
			# no shifting needed here, we're done.
	esac
done

################### END
#cd $RETURN
#else echo -e "$fcer Arg 1=$fcy empty$fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

