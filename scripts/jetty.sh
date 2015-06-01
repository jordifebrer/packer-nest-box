#!/bin/sh

cd /tmp

wget http://download.eclipse.org/jetty/9.2.11.v20150529/dist/jetty-distribution-9.2.11.v20150529.tar.gz

tar zxvf jetty-distribution-9.2.11.v20150529.tar.gz -C /opt

mv /opt/jetty-distribution-9.2.11.v20150529/ /opt/jetty

useradd -m jetty

chown -R jetty:jetty /opt/jetty/

ln -s /opt/jetty/bin/jetty.sh /etc/init.d/jetty

chkconfig --add jetty

chkconfig --level 345 jetty on

/bin/cat << EOF > /etc/default/jetty
JAVA=/opt/jdk1.8.0_45/bin/java
JETTY_HOME=/opt/jetty
JETTY_USER=jetty
JETTY_PORT=8080
JETTY_HOST=0.0.0.0
JETTY_LOGS=/opt/jetty/logs/
EOF

service jetty start
