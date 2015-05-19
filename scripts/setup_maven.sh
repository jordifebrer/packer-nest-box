#!/bin/sh

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
