#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

CONFIG_FILE="/home/opensilex/config/opensilex.yml"

cd $SCRIPT_DIR

java --add-opens java.base/java.io=ALL-UNNAMED  -jar $SCRIPT_DIR/opensilex.jar --BASE_DIRECTORY=$SCRIPT_DIR --CONFIG_FILE=$CONFIG_FILE "$@"

