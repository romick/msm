#!/bin/bash

#copy authorized_keys from env
mkdir ~/.ssh
echo $MSM_SSH_PUB_KEY >> ~/.ssh/authorized_keys

#create minecraft server
msm server create anyserver

#agree to EULA
sed -i -- 's/false/true/g' /opt/msm/servers/anyserver/eula.txt

#start minecraft server
msm anyserver start

#start ssh
/usr/sbin/sshd -D
