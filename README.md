# packer-nest-box
Checking packer.io in order to build some dev and tests boxes.


To validate the template:

	packer validate templates/centos66.json
  
To build from the template:

	packer build templates/centos66.json

To build from the template adding extra provision shell scripts:

	packer build -var 'scripts=scripts/basic.sh,scripts/java.sh,scripts/x11.sh' templates/centos66.json

Without any script passed as a parameter the build will only contains the basic configuration (basic.sh), see the command above to add more scripts to the build.