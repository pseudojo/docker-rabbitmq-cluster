#!/usr/bin/env bash
_BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
. $_BASE/common.sh

# SCRIPT_HOME

bash $SCRIPT_HOME/scripts/stop-rabbitmq.sh

sleep 1

bash $SCRIPT_HOME/scripts/start-rabbitmq.sh

sleep 0.1

bash $SCRIPT_HOME/scripts/trailing-logs-rabbitmq.sh

