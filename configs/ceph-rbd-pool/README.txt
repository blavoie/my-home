--------------------
---- Rererences ----
--------------------

http://docs.ceph.com/docs/jewel/rbd/libvirt/

virt-install problems

    http://www.isjian.com/ceph/virt-install-create-vm-use-rbd-pool/
    https://unix.stackexchange.com/questions/253642/can-i-enable-cephx-authentication-using-a-pool-in-qemu-kvm

---------------------
---- Let's do it ----
---------------------

$ ceph auth list
...
client.libvirt
        key: AQA6cjBZDNOzIRAA9jDPfq/f5jJWhzWwF315Ug==
        caps: [mon] allow r
        caps: [osd] allow class-read object_prefix rbd_children, allow rwx pool=libvirt-pool
...

$ virsh secret-define secret.xml 
Secret b618319c-d2b2-4227-a693-7cebe5ed2614 created

$ virsh secret-set-value b618319c-d2b2-4227-a693-7cebe5ed2614 AQA6cjBZDNOzIRAA9jDPfq/f5jJWhzWwF315Ug==

--- Edit libvirt-pool.xml and replace secret uuid 

$ virsh pool-create libvirt-pool.xml
Pool libvirt-pool created from libvirt-pool.xml

$ virsh pool-list
 Name                 State      Autostart 
-------------------------------------------
 libvirt-pool         active     no        
 
 
 



