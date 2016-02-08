export PATH=$PATH:/usr/local/bin
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
GET="$( eval /usr/local/bin/ff.dns.query $1 )"
if [[ ! "$GET" ]]; then
	exit 0
else 
	/usr/local/bin/ff.ssl.new $1
	#/usr/local/bin/ff.ssl.new $RESP
fi
XeF
