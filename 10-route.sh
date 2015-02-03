#!/bin/bash

# This script is called with the following arguments:
# Arg Name
# $1 Interface name  ppp0
# $2 The tty
# $3 The link speed
# $4 Local IP number
# $5 Peer IP number
# $6 Optional ``ipparam'' value foo

sysctl net.ipv4.conf.$1.rp_filter=0
iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
ip route del default
ip route add default dev $1
