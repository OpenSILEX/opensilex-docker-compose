#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
CONTAINER_DUMP_DIR="/tmp/dump_db_latest"

# dump path
# ├── mongodb
# │   └── opensilex-docker-db-2022-11-21
# └── rdf4j
#     └── opensilex-docker-db-2022-11-21

mkdir -p $1/mongodb
mkdir -p $1/rdf4j

if [ ! -d "$1" ]; then
    echo "$1 not exists on your filesystem. Try to create it"
    mkdir -p "$1"
    if [ ! -d "$1" ]; then
        echo "Creation failed" 
        exit 0;
    else
       echo "Creation succeed" 
    fi 
fi

if [ -n "$1" ]; then
  echo "DIRECTORY PATH TO STORE DUMP DATA : $1"
else
  echo "First parameter not supplied. DIRECTORY PATH TO STORE DUMP DATA. Ex : /home/{user}/dump_directory"
  exit 0
fi

echo "Preparing opensilex-docker-mongodb data"
docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-mongodb bash -c 'echo $CONTAINER_DUMP_DIR && rm -rf $CONTAINER_DUMP_DIR && mkdir -p $CONTAINER_DUMP_DIR && /usr/bin/mongodump --numParallelCollections=1 --db=${REPOSITORIES_NAME} --out=$CONTAINER_DUMP_DIR && mv ${CONTAINER_DUMP_DIR}/${REPOSITORIES_NAME} ${CONTAINER_DUMP_DIR}/$REPOSITORIES_NAME-`date +"%Y-%m-%d"`'
echo "Exporting opensilex-docker-mongodb data"
rm -rf $1/mongodb
docker cp opensilex-docker-mongodb:$CONTAINER_DUMP_DIR $1/mongodb
echo "Done opensilex-docker-mongodb"

echo "Preparing rdf4j data"
docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-rdf4j bash -c 'rm -rf $CONTAINER_DUMP_DIR && mkdir -p $CONTAINER_DUMP_DIR && wget http://localhost:8080/rdf4j-workbench/repositories/${REPOSITORIES_NAME}/export?Accept=application%2Ftrig -O $CONTAINER_DUMP_DIR/$REPOSITORIES_NAME-`date +"%Y-%m-%d"`'
echo "Exporting rdf4j data"
rm -rf $1/rdf4j
docker cp opensilex-docker-rdf4j:$CONTAINER_DUMP_DIR $1/rdf4j
echo "Done rdf4j"

