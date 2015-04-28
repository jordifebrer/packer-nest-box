#!/bin/sh

yum install -y perl

rpm --import http://packages.atrpms.net/RPM-GPG-KEY.atrpms
touch /etc/yum.repos.d/atrpms.repo

/bin/cat << EOF > /etc/yum.repos.d/atrpms.repo
[atrpms]
name=Fedora Core $releasever - $basearch - ATrpms
baseurl=http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable
gpgkey=http://ATrpms.net/RPM-GPG-KEY.atrpms
gpgcheck=1
EOF

yum install -y perl-Tk
