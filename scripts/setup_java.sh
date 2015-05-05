#!/bin/sh

cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
tar xzf jdk-7u79-linux-x64.tar.gz

/bin/cat << EOF >> /etc/bashrc
export JAVA_HOME=/opt/jdk1.7.0_79
export JRE_HOME=/opt/jdk1.7.0_79/jre
export PATH=$PATH:/opt/jdk1.7.0_79/bin:/opt/jdk1.7.0_79/jre/bin
EOF

touch /etc/yum.repos.d/apache-maven.repo

/bin/cat << EOF > /etc/yum.repos.d/apache-maven.repo
[epel-apache-maven]
name=maven from apache foundation.
baseurl=http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-6/x86_64/
enabled=1
skip_if_unavailable=1
gpgcheck=0

[epel-apache-maven-source]
name=maven from apache foundation. - Source
baseurl=http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-6/SRPMS
enabled=0
skip_if_unavailable=1
gpgcheck=0
EOF

yum install -y apache-maven
