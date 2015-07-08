#!/bin/bash
startgreen=`date +%s`
function stopwatchtime {
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}
# Generates a self-signed certificate.
# Edit dovecot-openssl.cnf before running this.
if [ ! "$EUID" = 0 ]; then
    echo "su yourself in first, Faron"
    stopwatchtime
fi
SSLDIR="/etc/ssl"
if [ ! "$SSLDIR/cnfs" ]; then
  mkdir -p $SSLDIR/cnfs
  echo "CNFS folder in SSL was not presented and folder was just created."
fi
# OPENSSLCONFIG="$SSLDIR/cnfs/$DOMAINE.cnf"
# CERTDIR="$SSLDIR/certs"
# KEYDIR="$SSLDIR/private"
# CERTFILE=""
# KEYFILE="$KEYDIR/$DOMAINE.pem"
DOMAIN1="$1"

if [[ ! "$DOMAIN1" ]]; then
  echo -n "name of the subdomain/domain? ('app' for key/cert for an app) "
  read DOMAIN1
  if [[ "$DOMAIN1" = "app" ]]; then
      echo -n "name for key? "
      read newkey
      #echo $CONFFILE > "/etc/ssl/cnfs/app_$newkey.conf"
      #openssl req -x509 -newkey rsa:1024 -keyout "$KEYDIR/app_$newkey.key" -out "$CERTDIR/app_$newkey.crt" -nodes -days 365
      openssl req -x509 -nodes -newkey rsa:1024 -keyout "$SSLDIR/private/app_$newkey.key" -out "$SSLDIR/certs/app_$newkey.crt" -days 365
      chmod 0600 "$SSLDIR/private/app_$newkey.key"
      echo "$newkey.key certified and privatized (Location: $SSLDIR/private/app_$newkey.key)"
      stopwatchtime
    else
    DOMAINE="$( echo $DOMAIN1 | tr '*' 'A' | tr '.' '_' )"
      #find "$SSLDIR" -type f -name "*$DOMAINE*" -exec rm {} \;
      echo "SYSTEM CHECK = OK"
    sh -c "echo \"
[ req ]
default_bits = 2048
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
\" > $SSLDIR/cnfs/$DOMAINE.cnf"
      echo "CONFIGURATION GENERATING FOR = $DOMAIN1"
      echo "POPULATING CERTIFICATE: $DOMAINE.pem"
      echo "CERTS DIR = OK..."
      if [ ! -d "$SSLDIR/private" ]; then
        mkdir -p $SSLDIR/private
        echo "PRIVATE DIR = NO --> CREATED FOLDER --> NOW OK"
      else
        echo "PRIVATE DIR = OK"
      fi
      if [ ! -f "$SSLDIR/private/$DOMAINE.pem" ]; then
          echo "KEY FILE = NEW"
        else
          echo -n "REPLACE OLD KEY WITH NEW ONE? (y = proceed | RETURN = keep) "
          read KEYCHECK
          if [[ "$KEYCHECK" = "y" ]] || [[ "$KEYCHECK" = "Y" ]]; then
            echo "KEY FILE = NEW"
            rm "$SSLDIR/private/$DOMAINE.pem"
          else
            echo "KEY FILE = KEEP"
          fi
      fi
      if [ ! -f "$SSLDIR/certs/$DOMAINE.pem" ]; then
          echo "CERT FILE = NEW"
        else
          echo -n "REPLACE OLD CERT WITH NEW ONE? (y = proceed | RETURN = keep) "
          read CERTCHECK
          if [[ "$CERTCHECK" = "y" ]] || [[ "$CERTCHECK" = "Y" ]]; then
            echo "CERT FILE = NEW"
            rm "$SSLDIR/certs/$DOMAINE.pem"
          else
            echo "CERT FILE = KEEP"
          fi
      fi
      # if [ -f "$SSLDIR/certs/$DOMAINE.pem" ]; then
      #   echo "REPLACE OLD CERT WITH NEW ONE? ( y/Y to replace | RETURN to continue without replacing) "
      #   read REPLACEFILE
      #     if [[ "$REPLACEFILE" = "y" ]] || [[ "$REPLACEFILE" = "Y" ]]; then
      #       rm "$SSLDIR/certs/$DOMAINE.pem"
      #       echo "CERTS FILE = NEW"
      #     fi
      #   echo "CERTS FILE = EXIST --> USING IT FOR THIS PROCESS"
      # fi

      echo "PREREQUIREMENT = SUCCESS!"
      openssl req -new -x509 -nodes -config "$SSLDIR/cnfs/$DOMAINE.cnf" -out "$SSLDIR/certs/$DOMAINE.pem" -keyout "$SSLDIR/private/$DOMAINE.pem" -days 365
      echo "CERTIFICATE AND KEY GENERATED AND IMPLEMENTED"
      chmod 0600 $SSLDIR/private/$DOMAINE.pem
      echo "KEY PRIVATIZED FOR SERVER READ"
      openssl x509 -subject -fingerprint -noout -in "$SSLDIR/certs/$DOMAINE.pem"
      echo "KEY/CERTIFICATE FINGERPRINTED AND SEALED FOR USE: $DOMAIN1"
    fi
fi
stopwatchtime
