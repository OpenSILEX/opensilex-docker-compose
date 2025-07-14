#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
CONTAINER_DUMP_DIR="/tmp/dump_db_latest"
ENV_FILE_PATH=$(readlink -f $SCRIPT_DIR/../opensilex.env)

echo "LOADING ENV FILE : $ENV_FILE_PATH"
set -a
source $ENV_FILE_PATH
set +a

if [ -n "$1" ]; then
  echo "DIRECTORY PATH TO STORE DUMP DATA : $1"
else
  echo "First parameter not supplied. DIRECTORY PATH TO STORE DUMP DATA. Ex : /home/{user}/dump_directory"
  exit 0
fi

# dump path
# ├── mongodb
# │   └── sandbox-sixtine-opensilex-docker-db-2022-11-21
# └── rdf4j
#     └── sandbox-sixtine-opensilex-docker-db-2022-11-21
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


echo "Preparing $MONGO_DOCKER_NAME data"
docker exec -i --env-file $ENV_FILE_PATH $MONGO_DOCKER_NAME bash -c 'echo $CONTAINER_DUMP_DIR && rm -rf $CONTAINER_DUMP_DIR && mkdir -p $CONTAINER_DUMP_DIR && /usr/bin/mongodump --numParallelCollections=1 --db=${REPOSITORIES_NAME} --out=$CONTAINER_DUMP_DIR && mv ${CONTAINER_DUMP_DIR}/${REPOSITORIES_NAME} ${CONTAINER_DUMP_DIR}/$REPOSITORIES_NAME-`date +"%Y-%m-%d"`'
echo "Exporting $MONGO_DOCKER_NAME data"
rm -rf $1/mongodb
docker cp $MONGO_DOCKER_NAME:$CONTAINER_DUMP_DIR $1/mongodb
echo "Done $MONGO_DOCKER_NAME"

echo "Preparing rdf4j data"
docker exec -i --env-file $ENV_FILE_PATH $RDF4J_DOCKER_NAME bash -c 'rm -rf $CONTAINER_DUMP_DIR && mkdir -p $CONTAINER_DUMP_DIR && wget http://localhost:8080/rdf4j-workbench/repositories/${REPOSITORIES_NAME}/export?Accept=application%2Ftrig -O $CONTAINER_DUMP_DIR/$REPOSITORIES_NAME-`date +"%Y-%m-%d"`'
echo "Exporting rdf4j data"
rm -rf $1/rdf4j
docker cp $RDF4J_DOCKER_NAME:$CONTAINER_DUMP_DIR $1/rdf4j
echo "Done rdf4j"

