#!/bin/sh

cd /opt/
wget https://services.gradle.org/distributions/gradle-2.4-bin.zip
unzip gradle-2.4-bin.zip

ln -sf /opt/gradle-2.4/bin/gradle /usr/local/bin/gradle
