#!/bin/bash
api_status=`echo $(curl --write-out %{http_code} --silent --connect-timeout 3 \
                  --no-keepalive --output /dev/null http://127.0.0.1:80)`

if [ "$api_status" -ne 200 ]; then
  echo "ERROR"
else
  echo "Everything seems ok :)"
fi