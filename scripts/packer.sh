#!/bin/sh

cd /tmp

wget https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
unzip packer_0.7.5_linux_amd64.zip -d /usr/local/bin/
rm -rf packer_0.7.5_linux_amd64.zip

/bin/cat << EOF >> /etc/bashrc
alias packer="/usr/local/bin/packer"
EOF
