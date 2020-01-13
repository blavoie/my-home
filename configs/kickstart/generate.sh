#!/usr/bin/env bash

. env-proxy

VERSION=7
SQUID=http://192.168.100.1:3128

SLEEP=300

# Cleanup targets

rm -rf target/* >/dev/null 2>&1

# Define variant
# To get your system supported variants: osinfo-query os

if [[ $VERSION -eq 7 ]]; then
    VARIANT='centos7.0'
    LOCATION='http://centos.mirror.iweb.ca/7/os/x86_64'
elif [[ $VERSION -eq 8 ]]; then
    VARIANT='centos8'
    LOCATION='http://centos.mirror.iweb.ca/8/BaseOS/x86_64/os'
fi

# Loop for each file lines, skip commented ones

while read LINE; do

    # Skip commented lines
    if [[ $LINE =~ ^#.* ]]; then
      continue
    fi

    echo $LINE

    HOSTNAME=$(echo $LINE | cut -f1 -d ',')
    IP=$(echo $LINE | cut -f2 -d ',')

    NEWFILE="kickstart.$HOSTNAME.cfg"
    cp kickstart.${VERSION}.cfg ./target/$NEWFILE

    sed -i "s|localhost.localdomain|$HOSTNAME|g" ./target/$NEWFILE
    sed -i "s|HOSTNAME|$HOSTNAME|g"              ./target/$NEWFILE
    sed -i "s|IPADDR|$IP|g"                      ./target/$NEWFILE
    sed -i "s|SQUID|$SQUID|g"                    ./target/$NEWFILE

    virt-install \
        --connect qemu:///system \
        --name $HOSTNAME \
        --memory memory=2048,maxmemory=4028 \
        --vcpus=4 \
        --disk size=10,bus=virtio,cache=writeback \
        --network=network:default \
        --sound=none \
        --os-type=linux \
        --os-variant ${VARIANT} \
        --location ${LOCATION} \
        --initrd-inject ./target/$NEWFILE \
        --extra-args "ks=file:/$NEWFILE ip=dhcp proxy=$SQUID" &

    # Let some time go between each vm to overload host and let squid properly
    # build its cache
    sleep $SLEEP

done < generate.hosts.txt
