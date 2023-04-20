#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

while true ; do
  docker compose logs --tail=10 -f $@ ;
  echo "-===================="
  echo "exit code $?"
  sleep 5s
  echo "-===================="
done

