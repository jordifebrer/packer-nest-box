#!/bin/sh

cd /opt/
wget https://services.gradle.org/distributions/gradle-2.4-bin.zip
unzip gradle-2.4-bin.zip

/bin/cat << EOF >> /etc/bashrc
export GRADLE_HOME=/opt/gradle-2.4
export PATH=$PATH:/opt/gradle-2.4/bin
EOF
