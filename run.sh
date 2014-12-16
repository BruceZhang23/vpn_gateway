#!/bin/bash

VPN_PROFILE_NAME=${VPN_PROFILE_NAME:-"pptp_vpn"}
VPN_ENCRYPT=${VPN_ENCRYPT:+--$VPN_ENCRYPT}

pptpsetup --create $VPN_PROFILE_NAME --server $VPN_SERVER --username $VPN_USER --password $VPN_PASSWORD $VPN_ENCRYPT

# Do not dial if DO_NOT_CONNECT present.
if [[ ${DO_NOT_CONNECT+"true"} ]]
then

fi

