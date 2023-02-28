#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

java -jar $SCRIPT_DIR/opensilex/opensilex.jar --BASE_DIRECTORY=$SCRIPT_DIR/opensilex --CONFIG_FILE=config/opensilex.yml "$@"

 