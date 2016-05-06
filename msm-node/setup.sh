#!/bin/bash

#copy authorized_keys from env
mkdir ~/.ssh
echo $MSM_SSH_PUB_KEY >> ~/.ssh/authorized_keys

export MSM_SERVER_NAME=${MSM_SERVER_NAME:=anyserver}
export MSM_MAP_NAME=${MSM_MAP_NAME:=default}

#create minecraft server
msm server create $MSM_SERVER_NAME

#copy map to server folder
cp -r /data/global-maps/$MSM_MAP_NAME /opt/msm/servers/$MSM_SERVER_NAME/worldstorage/

#start minecraft server
msm $MSM_SERVER_NAME start

#agree to EULA
sed -i -- 's/false/true/g' /opt/msm/servers/$MSM_SERVER_NAME/eula.txt

#start minecraft server, again...
msm $MSM_SERVER_NAME start

#start ssh
/usr/sbin/sshd -D
