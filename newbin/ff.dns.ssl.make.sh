export PATH=$PATH:/home/faron/.bin
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
GET="$( eval /home/faron/.bin/ff.dns.query $1 )"
if [[ ! "$GET" ]]; then
	exit 0
else 
	/home/faron/.bin/ff.ssl.new $1
	#/home/faron/.bin/ff.ssl.new $RESP
fi
XeF
