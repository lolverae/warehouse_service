#!/bin/bash

db_status=`echo $(curl --write-out %{http_code} --silent --connect-timeout 3 \
                  --no-keepalive --output /dev/null http://127.0.0.1:5984)`

api_status=`echo $(curl --write-out %{http_code} --silent --connect-timeout 3 \
                  --no-keepalive --output /dev/null http://127.0.0.1:80)`

#__________ get the STATUS (from code) which is human interpretable:
if [ "$api_status" -ne 200 ] && [ "$db_status" -ne 200 ]; then
  echo "Both containers have errors"
elif [ "$api_status" -ne 200 ];then
  echo "ERROR: The micro service container is having problems"
elif [  "$db_status" -ne 200 ]; then 
  echo "ERROR: The database container is having problems" 
else
  echo "Everything seems ok :)"
fi
