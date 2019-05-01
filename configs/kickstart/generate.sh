#!/usr/bin/env bash

. env-proxy

while read LINE; do
    echo $LINE

    HOSTNAME=$(echo $LINE | cut -f1 -d ',')
    IP=$(echo $LINE | cut -f2 -d ',')

    NEWFILE="kickstart.$HOSTNAME.cfg"
    cp kickstart.cfg ./target/$NEWFILE

    sed -i "s/localhost.localdomain/$HOSTNAME/g" ./target/$NEWFILE
    sed -i "s/192.168.100.10/$IP/g"              ./target/$NEWFILE

    virt-install \
        --connect qemu:///system \
        --name $HOSTNAME \
        --memory memory=1536,maxmemory=4028 \
        --vcpus=2 \
        --disk size=8,bus=virtio,cache=writeback \
        --network=network:default \
        --sound=none \
        --os-type=linux \
        --os-variant centos7.0 \
        --location http://centos.mirror.iweb.ca/7/os/x86_64/ \
        --initrd-inject ./target/$NEWFILE \
        --extra-args "ks=file:/$NEWFILE ip=dhcp proxy='http://gateway:3128'" &

    sleep 25

done < generate.hosts.txt
