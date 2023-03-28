# VITIS EXPLORER

## Pre-requesite softwares

**Tested Operating system :**

[![Ubuntu22.04](https://img.shields.io/badge/Ubuntu-22.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://releases.ubuntu.com/22.04/)

[![Debian11](https://img.shields.io/badge/Debian-11-E95420?style=for-the-badge&logo=debian&logoColor=white)](https://www.debian.org/releases/bullseye/releasenotes)

_Not working operating system :_

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

First you need to have these software installed, you can check if they are [installed](#check-your-installed-softwares) :

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Check your installed softwares

Following commands should work from everywhere in your system without errors:

`git --version`

`docker --version`

`docker compose version`

## Stack software name with associated versions

- Mandatory softwares :

  - RDF4J - 3.7.7
  - MongoDB - 5.0.14
  - OpenSILEX - 1.0.0-rc+6.5

- Other managements softwares :
  - mongo-express (A web based gui for mongo) - 1.0.0-alpha.4


## Run minimal opensilex docker stack compose

- With a bash terminal go to the project directory (where this readme is located).

- You must run docker compose up command to start your installation:

- With a bash terminal go to the project directory (where this readme is located).
- You must run docker compose up command to start your installation:

```bash
docker compose --env-file vitis-explorer.env build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
docker compose --env-file vitis-explorer.env run --rm start_opensilex_stack
```

- Expected Output:

```bash
[+] Running 3/0
 ⠿ Container opensilex-docker-rdf4j       Running                                                                                                                                              0.0s
 ⠿ Container opensilex-docker-mongodb       Running                                                                                                                                              0.0s
 ⠿ Container opensilex-docker-opensilexapp  Recreated                                                                                                                                            0.0s
[+] Running 1/1
 ⠿ Container opensilex-docker-opensilexapp  Started                                                                                                                                              0.4s
Waiting for mongo to listen on 27017...
Waiting for rdf4j to listen on 8080...
Waiting for opensilex to listen on 8081..
sleeping
sleeping
sleeping
[wait until it starts]
```

This previous action will block your terminal. When the terminal will be accessible again the opensilex app process will be started and ready.

## Import databases

```bash
 bash ../../dump_scripts/import_data.sh dumps/vitis-explorer-dev/2023-01-31/
```

## Export databases

```bash
 bash ../../dump_scripts/export_data.sh dumps/vitis-explorer-dev/2023-01-31/