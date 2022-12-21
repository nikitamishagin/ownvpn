#!/bin/bash
# First argument: Client identifier

KEY_DIR=~/client-configs/keys
OUTPUT_DIR=~/client-configs/files
BASE_CONFIG=~/client-configs/base.conf

# Generate new cert/key pair
if /usr/share/easy-rsa/easyrsa --batch gen-req ${1} nopass && /usr/share/easy-rsa/easyrsa --batch sign-req client ${1}; then
	if cp ~/easy-rsa/pki/private/${1}.key ${KEY_DIR} && cp ~/easy-rsa/pki/issued/${1}.crt ${KEY_DIR}; then
		echo ""
	else
		echo "### Coping cert failed! ###"
		exit 1
	fi
else
	echo "### Generation key failed! ###"
	exit 1
fi

# Create client config
cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-crypt>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-crypt>') \
    > ${OUTPUT_DIR}/${1}.ovpn