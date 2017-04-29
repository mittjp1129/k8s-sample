#!/bin/bash

MASTER=`gcloud compute instances list --filter STATUS=RUNNING | grep k8s-master | awk -F" " '{ print $5,$1 }'`
echo $MASTER
if [ -n "$MASTER" ]
then
    sudo sed -i -e "s/.* k8s-master/$MASTER/g" /etc/hosts
fi

NODE1=`gcloud compute instances list --filter STATUS=RUNNING | grep k8s-node1 | awk -F" " '{ print $5,$1 }'`
echo $NODE1
if [ -n "$NODE1" ]
then
    sudo sed -i -e "s/.* k8s-node1/$NODE1/g" /etc/hosts
fi

NODE2=`gcloud compute instances list --filter STATUS=RUNNING | grep k8s-node2 | awk -F" " '{ print $5,$1 }'`
echo $NODE2
if [ -n "$NODE2" ]
then
    sudo sed -i -e "s/.* k8s-node2/$NODE2/g" /etc/hosts
fi
