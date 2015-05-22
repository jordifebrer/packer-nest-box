#!/bin/sh

yum install -y rsyslog

/bin/cat << EOF >> /etc/rsyslog.conf
# Provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514
 
# Provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514
EOF

touch /etc/rsyslog.d/user.conf

/bin/cat << EOF > /etc/rsyslog.d/user.conf
user.*          /var/log/user.log
user.*          @remotelogserver
EOF

sudo service rsyslog restart

# logger -p user.info "test message"
