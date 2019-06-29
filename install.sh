#!/bin/bash

if [ -z "$POSTMASTER_PASSWORD" ]; then
  echo "An administrator password must be set"
  exit 1
fi

curl -o setup.sh https://raw.githubusercontent.com/tomav/docker-mailserver/master/setup.sh; chmod a+x ./setup.sh
curl -o docker-compose.yml https://raw.githubusercontent.com/tomav/docker-mailserver/master/docker-compose.yml.dist

docker-compose up -d mail
./setup.sh email add postmaster@x0r.net $POSTMASTER_PASSWORD
./setup.sh config dkim
docker-compose down
