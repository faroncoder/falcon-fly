#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
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
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apache2.enable.sh  [ACTIVE] y

