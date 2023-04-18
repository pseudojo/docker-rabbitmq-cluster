#!/usr/bin/env bash

_rabbit=3

docker-compose down --timeout 3 ;
 
sleep 5 ;
# single node
# docker-compose --env-file ./.env --file ./docker-compose.yml up -d ;

# 3 nodes
docker-compose --env-file ./.env --file ./docker-compose.yml up -d --scale rabbit="${_rabbit}"

