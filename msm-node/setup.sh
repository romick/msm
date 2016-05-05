#!/bin/bash

#copy authorized_keys from env
mkdir ~/.ssh
echo $MSM_SSH_PUB_KEY >> ~/.ssh/authorized_keys

#create minecraft server
msm server create anyserver

#start minecraft server
msm anyserver start

#start ssh
/usr/sbin/sshd -D
