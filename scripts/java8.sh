#!/bin/sh

cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
tar xzf jdk-8u45-linux-x64.tar.gz

/bin/cat << EOF >> /etc/bashrc
export JAVA_HOME=/opt/jdk1.8.0_45
export JRE_HOME=/opt/jdk1.8.0_45/jre
export PATH=$PATH:/opt/jdk1.8.0_45/bin:/opt/jdk1.8.0_45/jre/bin
EOF
