#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

for DOMAIN in $( virsh list --name ); do
  virsh shutdown $DOMAIN --mode acpi
done
