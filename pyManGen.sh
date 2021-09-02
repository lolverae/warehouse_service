#!/bin/bash
$(git clone https://github.com/lolverae/genManifest)
COMMIT_ID=$(git rev-parse --verify HEAD | cut -f3) 
IMAGE_VERSION=$(cat version.env)-$(cut -c1-6 <<< $COMMIT_ID)
cd genManifest
python3 genManifest.py warehouse $IMAGE_VERSION
sleep 10
cd .. && rm -rf genManifest