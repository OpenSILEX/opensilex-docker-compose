#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
CONTAINER_RESTORE_DIR=/tmp/restore_db_latest


if [ -n "$1" ]; then
  echo "DIRECTORY PATH TO RESTORE DUMP DATA : $1"
else
  echo "First parameter not supplied. Ex : /home/{user}/dump_directory. DIRECTORY PATH TO RESTORE DUMP DATA - ONLY THE FIRST DIRECTORY OF EACH SUBDIRECTORY WILL BE USED . Ex : opensilex-docker-db-2022-11-21
        restore
        ├── mongodb
        │   └── opensilex-docker-db-2022-11-21
        └── rdf4j
            └── opensilex-docker-db-2022-11-21"
  exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1 not exists on your filesystem."
    mkdir -p "$1" 
    exit 0;
fi


docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-mongodb bash -c 'echo $CONTAINER_RESTORE_DIR && rm -rf $CONTAINER_RESTORE_DIR && mkdir -p $CONTAINER_RESTORE_DIR'
docker cp $1/mongodb opensilex-docker-mongodb:$CONTAINER_RESTORE_DIR
echo "Preparing opensilex-docker-mongodb data"
docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-mongodb bash -c 'mongo redirect --eval "db.getSiblingDB(\"${REPOSITORIES_NAME}\");db.dropDatabase();db.getSiblingDB(\"${REPOSITORIES_NAME}\")"' 
echo "Importing data to opensilex-docker-mongodb "
docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-mongodb bash -c ' cd $CONTAINER_RESTORE_DIR && files=(*) && echo $CONTAINER_RESTORE_DIR && echo $CONTAINER_RESTORE_DIR/${files[0]} && /usr/bin/mongorestore  --numParallelCollections=1 --db=${REPOSITORIES_NAME} $CONTAINER_RESTORE_DIR/${files[0]}/* '
echo "Importation to opensilex-docker-mongodb done"

echo "Preparing rdf4j data"
docker exec -u root -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-rdf4j bash -c 'echo $CONTAINER_RESTORE_DIR && rm -rf $CONTAINER_RESTORE_DIR && mkdir -p $CONTAINER_RESTORE_DIR'
echo "Importing data to opensilex-docker-rdf4j "
docker cp $1/rdf4j/* opensilex-docker-rdf4j:$CONTAINER_RESTORE_DIR
# The difference between @ and < , in the curl command, is then that @ makes a
# file get attached in the post as a file upload,
# while the < makes a text field and just get the
# contents for that text field from a file.
docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-rdf4j bash -c 'curl -vvv -X DELETE http://localhost:8080/rdf4j-server/repositories/${REPOSITORIES_NAME}/statements'
docker exec -i --env-file $SCRIPT_DIR/../opensilex.env opensilex-docker-rdf4j bash -c 'cd $CONTAINER_RESTORE_DIR && files=(*) && echo ${files[0]}  && curl -vvv -X POST -H "Content-type:application/x-trig;charset:UTF-8" --data-binary "@${files[0]}" http://localhost:8080/rdf4j-server/repositories/${REPOSITORIES_NAME}/statements'
echo "Done rdf4j"

