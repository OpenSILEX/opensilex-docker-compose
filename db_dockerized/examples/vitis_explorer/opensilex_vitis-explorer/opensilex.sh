#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

CONFIG_FILE="$SCRIPT_DIR/../config/opensilex.yml"

cd $SCRIPT_DIR

java -jar $SCRIPT_DIR/opensilex.jar --BASE_DIRECTORY=$SCRIPT_DIR --CONFIG_FILE=$CONFIG_FILE "$@"

