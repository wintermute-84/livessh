#!/bin/bash

PROJECT=$1
PROJECTSDIR="/home/web/capistrano/projects/"

if [ ! -n "$PROJECT" ]; then
    echo "Project name not provided"
    exit 1
fi

if [ ! -d ${PROJECTSDIR}${PROJECT}.project/ ];
then
    echo "Project directory doesn't exist"
    exit 1
fi

IP=`grep -PRoh --exclude-dir=repo --exclude-dir=log --include=live.rb "\bserver '\K[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" ${PROJECTSDIR}${PROJECT}.project/`
echo "SSH to $1 at $IP"

ssh apache@${IP}
