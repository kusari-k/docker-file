#!/bin/bash

cd $(dirname $0)

#read setting file
sed -z -e "s/.*##\+samba#*//g" \
	-e "s/##.\+//g" setting.txt >setting.log

#run container
read -p "do you want to up container ? (y/n):" yn
if [ ${yn,,} = "y" ]; then
	podman rmi -f samba
	podman build -f Dockerfile -t samba
fi

rm *.log
