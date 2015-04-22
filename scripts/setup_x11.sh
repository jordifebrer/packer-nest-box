#!/bin/sh

yum -y groupinstall "development tools" "X Window System" "Desktop" "Fonts" "General Purpose Desktop"
sed -i 's/id:3:initdefault:/id:5:initdefault:/' /etc/inittab
