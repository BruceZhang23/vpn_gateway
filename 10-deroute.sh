#!/bin/bash

# This script is called with the following arguments:
# Arg Name
# $1 Interface name
# $2 The tty
# $3 The link speed
# $4 Local IP number
# $5 Peer IP number
# $6 Optional ``ipparam'' value foo

ip route add default via 192.168.59.1
iptables -t nat -D POSTROUTING -o $1 -j MASQUERADE
