#!/usr/bin/env bash
if [ "$#" -eq 0 ]; then
  _rabbit=1
else
  _rabbit="$1"
  if [ "${_rabbit}" -lt 1 ]; then
    echo "Rabbit cannot scale less than 1."
    exit 1
  fi
  echo "Rabbit Scale: [ ${_rabbit} ]"
fi

docker compose --env-file ./.env --file ./docker compose.yml up -d --scale rabbit="${_rabbit}"

