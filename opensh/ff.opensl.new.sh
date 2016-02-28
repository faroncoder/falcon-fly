#!/bin/bash
DOMAIN1=$1
         CNF="
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
O=FARON
OU=DEVELOPMENT
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
"


echo $CNF > "/tmp/_cnf"

      openssl genrsa -des3 -out "$1.key" 1024
      openssl req -new -key "$1.key" -out "$1.csr"
      openssl x509 -req -days 365 -config "/tmp/_cnf" -in "$1.csr" -signkey "$1.key" -out "$1.crt"
      openssl x509 -req -days 365 -in "$1.csr" -signkey "$1.key" -out "$1.crt"
      cp "$1.key" "$1_copy.key"
      openssl rsa -in "$1_copy.key" -out "$1.key"
      openssl x509 -req -days 365 -in "$1.csr" -signkey "$1.key" -out "$1.crt"
> "/tmp/_cnf"
      exit 0
