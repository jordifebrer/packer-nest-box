#!/bin/sh

yum install -y epel-release
yum install -y docker-io

service docker start
chkconfig docker on

# check if the docker group exists
# cat /etc/group | grep docker

# create a docker group
# sudo groupadd docker

# add packer user the docker group in order to avoid sudo
usermod -g docker packer

# lists packer user groups
# groups packer

# reboot
