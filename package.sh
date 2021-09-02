#!/bin/bash
#echo "Enter a name for the docker image: "
#read IMAGE_NAME
whoami
COMMIT_ID=$(git rev-parse --verify HEAD | cut -f3) 

IMAGE_VERSION=$(cat version.env)-$(cut -c1-6 <<< $COMMIT_ID)
echo "version: $IMAGE_VERSION"
export $IMAGE_VERSION
ansible-playbook -e "image_name=lolverae/warehouse_service" -e "image_version=$IMAGE_VERSION" ansible/image-build.yml
