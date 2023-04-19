#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

docker compose logs --tail=10 -f $@ ;

