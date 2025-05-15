
# Major migration

## From 1.4.4 version to 1.4.6
 
1. We recommend to [Export mongo and rdf4j data](README.md#export-data)

2. Stop docker containers
```bash
docker compose --env-file opensilex.env down  
```
3. Update opensilex.env or get the configuration of latest version

4. Start stack

```bash
docker compose --env-file opensilex.env build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
docker compose --env-file opensilex.env up start_opensilex_stack -d
```
if necessary : 

[Import mongo and rdf4j saved data](README.md#import-data) 

## From 1.4.1 version to 1.4.4

 
1. [Export mongo and rdf4j data](README.md#export-data)

2. Stop and remove exisiting docker containers
```bash
docker compose --env-file opensilex.env down --volumes
```
3. Update opensilex.env or get the latest version

4. Start stack

```bash
docker compose --env-file opensilex.env build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
docker compose --env-file opensilex.env up start_opensilex_stack -d
```

5. [Import mongo and rdf4j saved data](README.md#import-data)





## From previous version 1.0.0-rc+5.2 (compose v2)

If you had a previous installation go to the directory where the project have been clone.
And execute the following command to remove previous docker stack :

```bash
# Remove old containers
docker stop mongodb && docker rm mongodb
docker stop opensilexapp && docker rm opensilexapp
docker stop rdf4jdb && docker rm rdf4jdb
docker stop haproxy && docker rm haproxy
docker stop mongoexpressgui && docker rm mongoexpressgui
```

## From previous version 1.0.0-rc+5.1 (compose v1)

If you had a previous installation go to the directory where the project have been clone.
And execute the following command to remove previous docker stack :

```bash
# Remove old containers
docker stop mongodb && docker rm mongodb
docker stop opensilexapp && docker rm opensilexapp
docker stop rdf4jdb && docker rm rdf4jdb
docker stop haproxy && docker rm haproxy
docker stop mongoexpressgui && docker rm mongoexpressgui
```

## From previous version before 1.0.0-rc+5.1 (compose v1)

If you had a previous installation go to the directory where the project have been clone.
And execute the following command to remove previous docker stack :

```bash
# Remove old containers
docker stop mongodb && docker rm mongodb
docker stop opensilex && docker rm opensilex
docker stop rdf4j && docker rm rdf4j
```