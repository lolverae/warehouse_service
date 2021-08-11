#!/bin/bash
# checar version
# 1.0.1 
# append commit id
# create job, run to generate new docker tag, 
# change based on the commit id, crear archivo en python con la version y aumentar la version, 
# desde 1.0.0. ej,
# 
# $(ansible playbook -e="image_name=sadln" -e "{})


#echo "Enter a name for the docker image: "
#read IMAGE_NAME

COMMIT_ID=$(git rev-parse --verify HEAD | cut -f3) 

IMAGE_VERSION=$(cat version.env)-$(cut -c1-6 <<< $COMMIT_ID)
echo $IMAGE_VERSION
$(ansible-playbook -i -e image_name=lolverae/warehouse_service -e image_version=$IMAGE_VERSION)
