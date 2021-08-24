#!/bin/bash

APP_PORT=$(grep APP_PORT .env | cut -d '=' -f2)
docker inspect integration_couch_1 | grep -w healthy > /dev/null
if [ $? -eq 0 ]; then
    db_status=200
fi


#$(docker inspect warehouse-service_couch_1 | grep -w healthy)&&db_status=300
api_status=`echo $(curl --write-out %{http_code} --silent --connect-timeout 3 \
                  --no-keepalive --output /dev/null http://localhost:$APP_PORT)`
sleep 4
#__________ get the STATUS (from code) which is human interpretable:
if [ "$api_status" -ne "200" ] && [ "$db_status" -ne "200" ];then
  echo "Both containers have errors"
elif [ "$api_status" -ne 200 ];then
  echo "ERROR: The micro service container is having problems"
elif [ "$db_status" -ne 200 ];then 
  echo "ERROR: The database container is having problems" 
else
  echo "Everything seems ok :)"
fi
