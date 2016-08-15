#!/bin/bash
<<<<<<< HEAD
DOMAIN1="$1"

SUDO=""
if [[ "$EUID" != 0 ]]; then
	SUDO="sudo"
fi

=======
<<<<<<< HEAD
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
=======
DOMAIN1="$1"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

if [[ ! "$DOMAIN1" ]]; then
	echo -n "address of domain you wish to generate ssl for?"
	read DOMAIN1
else
	echo "name of domain/sub.domain  has to be entered."
	exit 1
fi

#echo -e "
#
#[ req_distinguished_name ]
#countryName			= Country Name (2 letter code)
#countryName_default		= CA
#stateOrProvinceName		= State or Province Name (full name)
#stateOrProvinceName_default	= ONTARIO
#localityName			= Locality Name (eg, city)
#localityName_default 		= TORONTO
#0.organizationName		= Organization Name (eg, company)
#0.organizationName_default	= FARON
#1.organizationUnitName		= Department
#1.organizationUnitName_default	= IT
#commonName_default		= $DOMAIN1
#emailAddress_default		=  postmaster@$DOMAIN1


#[ req ]
#default_bits = 2048
#distinguished_name = req_dn
#x509_extensions = v3_ca
#string_mask = utf8only
#prompt = no
#subjectKeyIdentifier=hash
#authorityKeyIdentifier=keyid,issuer
#subjectAltName=email:copy
#issuerAltName=issuer:copy

#[ v3_ca ]
#subjectKeyIdentifier=hash
#authorityKeyIdentifier=keyid:always,issuer
#basicConstraints = CA:true
#subjectAltName=email:copy
#issuerAltName=issuer:copy

#[ cert_type ]
#nsCertType = server
#" > "/etc/ssl/cnfs/$DOMAIN1.cnf"

cd /etc/ssl

	DOMAIN=$( echo $DOMAIN1 | tr '.' '_' )

<<<<<<< HEAD
      $SUDO openssl genrsa -des3 -out "$DOMAIN.key" 1024
$SUDO	openssl rsa -in "$DOMAIN.key" -out "private/$DOMAIN.key"
    $SUDO  openssl req -new -key "private/$DOMAIN.key" -out "certs/$DOMAIN.csr"
#      openssl x509 -req -days 365 -in "/etc/ssl/certs/$DOMAIN1.csr" -signkey "/etc/ssl/private/$DOMAIN1.key" -out "/etc/ssl/certs/$DOMAIN1.crt"
   $SUDO   openssl x509 -req -days 365 -in "certs/$DOMAIN.csr" -signkey "private/$DOMAIN.key" -out "certs/$DOMAIN.crt"
#      cp "/etc/ssl/$DOMAIN1.key" "/etc/ssl/$DOMAIN1_copy.key"
#      openssl rsa -in "/etc/ssl/$DOMAIN1.key" -out "/etc/ssl/private/$DOMAIN1.key"
 #     openssl x509 -req -days 365 -in "/etc/ssl/certs/$DOMAIN1.csr" -signkey "/etc/ssl/private/$DOMAIN1.key" -out "/etc/ssl/certs/$DOMAIN1.crt"
=======
      openssl genrsa -des3 -out "$DOMAIN.key" 1024
	openssl rsa -in "$DOMAIN.key" -out "private/$DOMAIN.key"
      openssl req -new -key "private/$DOMAIN.key" -out "certs/$DOMAIN.csr"
#      openssl x509 -req -days 365 -in "/etc/ssl/certs/$DOMAIN1.csr" -signkey "/etc/ssl/private/$DOMAIN1.key" -out "/etc/ssl/certs/$DOMAIN1.crt"
      openssl x509 -req -days 365 -in "certs/$DOMAIN.csr" -signkey "private/$DOMAIN.key" -out "certs/$DOMAIN.crt"
#      cp "/etc/ssl/$DOMAIN1.key" "/etc/ssl/$DOMAIN1_copy.key"
#      openssl rsa -in "/etc/ssl/$DOMAIN1.key" -out "/etc/ssl/private/$DOMAIN1.key"
 #     openssl x509 -req -days 365 -in "/etc/ssl/certs/$DOMAIN1.csr" -signkey "/etc/ssl/private/$DOMAIN1.key" -out "/etc/ssl/certs/$DOMAIN1.crt"


>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
      exit 0
