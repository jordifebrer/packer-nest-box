#!/bin/sh

rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y install docker-io

# check if the docker group exists
# cat /etc/group | grep docker

# create a docker group
# sudo groupadd docker

# add packer user the docker group in order to avoid sudo
sudo usermod -g docker packer

# lists packer user groups
# groups packer

# reboot
