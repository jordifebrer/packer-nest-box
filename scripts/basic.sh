#!/bin/sh

yum groupinstall -y development # or yum -y groupinstall "development tools"
yum -y install vim wget
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel openldap-devel libxml2-devel libxslt-devel
