#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

docker compose down --timeout 3 --remove-orphans ;
sleep 5 ;

