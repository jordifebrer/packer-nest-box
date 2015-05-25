# packer-nest-box
Checking packer.io in order to build some dev and tests boxes.


To validate the template:

	packer validate templates/centos66.json
  
To build from the template:

	packer build templates/centos66.json

To build from the template adding extra provision shell scripts:

	packer build -var 'scripts=scripts/basic.sh,scripts/java.sh,scripts/x11.sh' templates/centos66.json

Without any script passed as a parameter the build will only contains the basic configuration (basic.sh), see the command above to add more scripts to the build.

To build a 'rocket dock machine' in order to launch Packer and Docker on CentOS:

    packer build -var 'scripts=scripts/basic.sh,scripts/eth1.sh,scripts/packer.sh,scripts/docker.sh' templates/centos66.json

To run Packer as verbose as possible:

    PACKER_LOG=1 packer build -debug templates/docker.json
