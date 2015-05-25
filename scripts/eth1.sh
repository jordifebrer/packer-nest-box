#!/bin/sh

touch /etc/sysconfig/network-scripts/ifcfg-eth1

/bin/cat << EOF > /etc/sysconfig/network-scripts/ifcfg-eth1
DEVICE=eth1
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
IPADDR=192.168.56.100
NETMASK=255.255.255.0
EOF
