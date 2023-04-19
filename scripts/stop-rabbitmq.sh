#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

docker compose stop --timeout 3 ;
sleep 5 ;

