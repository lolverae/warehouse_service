#!/bin/bash

COMMIT_ID=$(git rev-parse --verify HEAD | cut -f3) 
IMAGE_VERSION=$(cat version.env)-$(cut -c1-6 <<< $COMMIT_ID)
cd /home/alberto/genManifest && python3 genManifest.py warehouse $IMAGE_VERSION 