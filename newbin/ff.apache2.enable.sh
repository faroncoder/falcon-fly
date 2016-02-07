#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
GET=( access_compat
actions
alias
auth_basic
authn_core
authn_file
authz_core
authz_host
authz_user
autoindex
cache_disk
cache
cache_socache
cgid
cgi
data
deflate
dir
env
expires
file_cache
filter
headers
include
info
mime
mime_magic
mpm_prefork
negotiation
php5
proxy_ajp
proxy_balancer
proxy
proxy_connect
proxy_express
proxy_fcgi
proxy_fdpass
proxy_ftp
proxy_html
proxy_http
proxy
proxy_scgi
proxy_wstunnel
rewrite
session_cookie
session_crypto
session_dbd
session
setenvif
slotmem_shm
socache_shmcb
ssl
status
vhost_alias
xml2enc
 )

 for j in "${GET[@]}"; do sudo a2enmod $j; done

 ff.apache2.restart

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.apache2.enable "
#  echo "example:  ff.apache2.enable  "
#fi
## TALON:
XeF


