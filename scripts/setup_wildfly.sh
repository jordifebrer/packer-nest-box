#!/bin/sh

useradd --system \
--comment "WildFly Application Server" \
--create-home --home /opt/wildfly \
--user-group wildfly

cd /opt/wildfly/
wget http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz
tar zxvf wildfly-8.2.0.Final.tar.gz

cd /etc/
mkdir wildfly
cd wildfly/
cp /opt/wildfly/wildfly-8.2.0.Final/bin/init.d/wildfly.conf ./

touch /etc/wildfly/wildfly.properties
/bin/cat << EOF > /etc/wildfly/wildfly.properties

JAVA_HOME=/opt/jdk1.7.0_79
JBOSS_HOME=/opt/wildfly/wildfly-8.2.0.Final
JBOSS_USER=wildfly
JBOSS_CONFIG=standalone-full.xml
JBOSS_CONSOLE_LOG="/var/log/wildfly/console.log"
JBOSS_OPTS="--properties=/etc/wildfly/wildfly.properties"

jboss.server.log.dir=/var/log/wildfly
jboss.server.temp.dir=/tmp/wildfly

jboss.bind.address=0.0.0.0
jboss.bind.address.management=0.0.0.0
jboss.server.log.dir=/var/log/wildfly
jboss.server.temp.dir=/tmp/wildfly
EOF

cd /etc/init.d
cp /opt/wildfly/wildfly-8.2.0.Final/bin/init.d/wildfly-init-redhat.sh ./wildfly
chkconfig --add wildfly
chkconfig --level 345 wildfly on
chkconfig --list wildfly

sed -i 's#JBOSS_CONF="/etc/default/wildfly.conf"#JBOSS_CONF="/etc/default/wildfly.conf"#g' /etc/init.d/wildfly
sed -i 's/-c $JBOSS_CONFIG/-c $JBOSS_CONFIG $JBOSS_OPTS/' /etc/init.d/wildfly

mkdir /var/log/wildfly
chown wildfly:wildfly /var/log/wildfly/

iptables --insert INPUT 5 \
         --match state \
         --state NEW \
         --protocol tcp \
         --destination-port 8080 \
         --source 10.0.0.0/24 \
         --jump ACCEPT

iptables --insert INPUT 6 \
         --match state \
         --state NEW \
         --protocol tcp \
         --destination-port 9990 \
         --source 10.0.0.0/24 \
         --jump ACCEPT

iptables -L --line-numbers
service iptables save
