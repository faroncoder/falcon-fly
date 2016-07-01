#!/bin/bash
DOMAIN1="$1"

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

      openssl genrsa -des3 -out "$DOMAIN.key" 1024
	openssl rsa -in "$DOMAIN.key" -out "private/$DOMAIN.key"
      openssl req -new -key "private/$DOMAIN.key" -out "certs/$DOMAIN.csr"
#      openssl x509 -req -days 365 -in "/etc/ssl/certs/$DOMAIN1.csr" -signkey "/etc/ssl/private/$DOMAIN1.key" -out "/etc/ssl/certs/$DOMAIN1.crt"
      openssl x509 -req -days 365 -in "certs/$DOMAIN.csr" -signkey "private/$DOMAIN.key" -out "certs/$DOMAIN.crt"
#      cp "/etc/ssl/$DOMAIN1.key" "/etc/ssl/$DOMAIN1_copy.key"
#      openssl rsa -in "/etc/ssl/$DOMAIN1.key" -out "/etc/ssl/private/$DOMAIN1.key"
 #     openssl x509 -req -days 365 -in "/etc/ssl/certs/$DOMAIN1.csr" -signkey "/etc/ssl/private/$DOMAIN1.key" -out "/etc/ssl/certs/$DOMAIN1.crt"


      exit 0
