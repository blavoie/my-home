#!/usr/bin/env bash

/usr/sbin/sshd

source /env
openconnect -b -q -u ${USER1} ${VPN1}
openconnect -b -q -u ${USER2} ${VPN2}

