export PATH=$PATH:/usr/local/bin
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
GET="$( eva source /usr/local/bin/ff.dns.query $1 )"
if [[ ! "$GET" ]]; then
	exit 0
else 
	source /usr/local/bin/ff.ssl.new $1
	#source /usr/local/bin/ff.ssl.new $RESP
fi
XeF
