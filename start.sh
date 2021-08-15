#!/bin/bash
APP_PORT_INPUT=9091
COUCHDB_USER_INPUT=admin
COUCHDB_PASSWORD_INPUT=pass123

# APP_PORT_INPUT=$(python3 -c 'import socket; s=socket.socket(); s.bind(("",0)); print(s.getsockname()[1]); s.close()');

printf "Access the app on http://localhost:9091"

echo COUCHDB_USER=$COUCHDB_USER_INPUT>.env
echo COUCHDB_PASSWORD=$COUCHDB_PASSWORD_INPUT>>.env
echo APP_PORT=$APP_PORT_INPUT>>.env

$(docker-compose up -d)