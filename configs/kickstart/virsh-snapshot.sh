#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

SNAPNAME="default"

for DOMAIN in $( virsh list --name --state-shutoff ); do
  virsh snapshot-create-as --domain $DOMAIN --name "$SNAPNAME"
done
