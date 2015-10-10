#!/bin/sh

# Generates a self-signed certificate.
# Edit dovecot-openssl.cnf before running this.


DOMAIN1="$1"
if [ -z "$DOMAIN1" ]
	then
	echo -n "name of the subdomain/domain? "
	read DOMAIN1
fi

DOMAINE=$( echo $DOMAIN1 | tr '*' 'A' | tr '.' '_' )

find /etc/ssl -type f -name "*$DOMAINE*" -exec rm {} \;

OPENSSL=${OPENSSL-openssl}
SSLDIR=${SSLDIR-/etc/ssl}
OPENSSLCONFIG=${OPENSSLCONFIG-/etc/ssl/cnfs/$DOMAINE.cnf}

CERTDIR=$SSLDIR/certs
KEYDIR=$SSLDIR/private

CERTFILE=$CERTDIR/$DOMAINE.pem
KEYFILE=$KEYDIR/$DOMAINE.pem
echo "PARAMS FOR CERTIFICATE COMPLETED"
sh -c "echo \"
[ req ]
default_bits = 2048
#encrypt_key = yes
distinguished_name = req_dn
x509_extensions = v3_ca
string_mask = utf8only
prompt = no

[ req_dn ]
C=CA
ST=ONTARIO
L=TORONTO
O=FARONINTEL
OU=IT
CN=$DOMAIN1
emailAddress=postmaster@$DOMAIN1
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer
subjectAltName=email:copy
issuerAltName=issuer:copy

[ v3_ca ]
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid:always,issuer
basicConstraints = CA:true
#nsCertType = sslCA, emailCA
subjectAltName=email:copy
issuerAltName=issuer:copy

[ cert_type ]
nsCertType = server

\" >> /etc/ssl/cnfs/$DOMAINE.cnf"
echo "CNF CREATED FOR $DOMAIN1"
echo "POPULATING PATH FOR CERTIFICATE: $DOMAIN1"

if [ ! -d $CERTDIR ]; then
  echo "$SSLDIR/certs directory doesn't exist"
  exit 1
fi
echo -n "CERTS DIR = OK..."
if [ ! -d $KEYDIR ]; then
  echo "$SSLDIR/private directory doesn't exist"
  exit 1
fi
echo -n "PRIVATE DIR = OK..."
if [ -f $CERTFILE ]; then
  echo "$CERTFILE already exists, won't overwrite"
  exit 1
fi
echo -n "CERTS FILE = NEW..."
if [ -f $KEYFILE ]; then
  echo "$KEYFILE already exists, won't overwrite"
  exit 1
fi
echo -n "KEY FILE = NEW..."
echo "SUCCESS!"
sudo $OPENSSL req -new -x509 -nodes -config $OPENSSLCONFIG -out $CERTFILE -keyout $KEYFILE -days 365 || exit 2
echo "CERTIFICATE AND KEY GENERATED AND INJECTED"
sudo chmod 0600 $KEYFILE
echo "CERTIFICATE AND KEY CHMOD-ED FOR THE SERVER READ"
sudo $OPENSSL x509 -subject -fingerprint -noout -in $CERTFILE || exit 2
echo "CERTIFICATE AND KEY FINGERPRINTED AND SEALED FOR DOMAIN: $DOMAIN1"
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
