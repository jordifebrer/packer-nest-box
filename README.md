# packer-nest-box
Checking packer.io in order to build some dev and tests boxes.

To validate the templates:

  packer validate templates/minimal.json
  packer validate templates/x11.json
  
To build the machines:

  packer build templates/minimal.json
  packer build templates/x11.json
