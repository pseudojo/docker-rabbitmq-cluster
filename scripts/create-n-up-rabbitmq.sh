#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

# SCRIPT_HOME

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

docker compose --env-file $SCRIPT_HOME/.env up -d --scale rabbit="${_rabbit}"

