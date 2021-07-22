#!/bin/bash
APP_PORT_INPUT=8000
echo "Enter a username for the DB: "
read COUCHDB_USER_INPUT
echo "Enter a password for the DB: "
read -s COUCHDB_PASSWORD_INPUT

APP_PORT_INPUT=$(python3 -c 'import socket; s=socket.socket(); s.bind(("",0)); print(s.getsockname()[1]); s.close()');

printf "Access the app on http://localhost:$APP_PORT_INPUT"

echo COUCHDB_USER=$COUCHDB_USER_INPUT>.env
echo COUCHDB_PASSWORD=$COUCHDB_PASSWORD_INPUT>>.env
echo APP_PORT=$APP_PORT_INPUT>>.env

$(docker compose up -d)
