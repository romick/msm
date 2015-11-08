#!/bin/bash

#copy authorized_keys from env
mkdir ~/.ssh
echo MSM_SSH_PUB_KEY >> ~/.ssh/authorized_keys

#start ssh
/usr/sbin/sshd -D
