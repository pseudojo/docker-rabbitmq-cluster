#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

bash ./stop-rabbitmq.sh

sleep 1

bash ./start-rabbitmq.sh


