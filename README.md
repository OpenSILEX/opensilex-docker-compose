# Minimalist opensilex docker compose environment

Docker compose environnent to deploy opensilex stack based on a previous work environment variables [opensilex-phis-igepp](https://github.com/p2m2/opensilex-phis-igepp)

- [Minimalist opensilex docker compose environment](#minimalist-opensilex-docker-compose-environment)
  - [Pre-requesite softwares](#pre-requesite-softwares)
  - [Check your installed softwares](#check-your-installed-softwares)
  - [Stack software name with associated versions](#stack-software-name-with-associated-versions)
  - [Installation steps](#installation-steps)
    - [Fresh new install (compose v2)](#fresh-new-install-compose-v2)
  - [Run minimal opensilex docker stack compose](#run-minimal-opensilex-docker-stack-compose)
    - [(First install only) Create an administrator user](#first-install-only-create-an-administrator-user)
  - [Stop docker stack](#stop-docker-stack)
  - [Other tools or customizations](#other-tools-or-customizations)
    - [(Optional) Add a gui for mongodb](#optional-add-a-gui-for-mongodb)
    - [(Optional) Add a reverse proxy](#optional-add-a-reverse-proxy)
    - [Migration steps from previous versions](#migration-steps-from-previous-versions)
      - [From previous version 1.0.0-rc+5.1 (compose v1)](#from-previous-version-100-rc51-compose-v1)
      - [From previous version before 1.0.0-rc+5.1 (compose v1)](#from-previous-version-before-100-rc51-compose-v1)
  - [Customize docker configuration](#customize-docker-configuration)
  - [Manage docker](#manage-docker)
  - [Debug installation](#debug-installation)
    - [Stop docker stack and erase all data (Be sure to delete all data)](#stop-docker-stack-and-erase-all-data-be-sure-to-delete-all-data)
  - [Acknowledgments](#acknowledgments)

## Pre-requesite softwares

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

  - RDF4J - 3.7.4
  - MongoDB - 4.4.6
  - OpenSILEX - 1.0.0-rc+5.2

- Other managements softwares :
  - mongo-express (A web based gui for mongo) - 1.0.0-alpha.4
  - haproxy (web server used as reverse proxy) - 2.4.6

## Installation steps

This docker version is related to [1.0.0-rc+5.2 OpenSILEX version](https://github.com/OpenSILEX/opensilex/releases/tag/1.0.0-rc%2B5.2).

### Fresh new install (compose v2)

Clone the repository to in order to get the project.

```bash
git clone --branch 1.0.0-rc+5.2 https://github.com/OpenSILEX/opensilex-docker-compose
cd opensilex-docker-compose
```

For migration steps from previous versions, take a look to the [Migration steps from previous version](#migration-steps-from-previous-versions) section

## Run minimal opensilex docker stack compose

- With a terminal go to the project directory (where this readme is located).
- You must run docker compose up command to start your installation:

```bash
docker compose --env-file opensilex.env run --rm start_opensilex_stack
```

- Expected Output:

```bash
[+] Running 3/0
 ⠿ Container rdf4jdb       Running                                                                                                                                              0.0s
 ⠿ Container mongodb       Running                                                                                                                                              0.0s
 ⠿ Container opensilexapp  Recreated                                                                                                                                            0.0s
[+] Running 1/1
 ⠿ Container opensilexapp  Started                                                                                                                                              0.4s
Waiting for mongo to listen on 27017...
Waiting for rdf4j to listen on 8080...
Waiting for opensilex to listen on 8081..
sleeping
sleeping
sleeping
[wait until it starts]
```

### (First install only) Create an administrator user

Docker volumes are persistent until you remove them. You only need to create once an user.

```bash
docker exec -it opensilexapp ./bin/opensilex.sh user add --admin --email=admin@opensilex.org --lang=fr --firstName=firstName --lastName=lastName --password=admin
```

After opensilex start you will be able to access to the application on port [localhost:8081/opensilex/app](http://localhost:8081/opensilex/app).

By default, different available services can be found at these adresses :

- OpenSILEX web application : <http://localhost:8081/opensilex/app>
- OpenSILEX API : <http://localhost:8081/opensilex/api-docs>
- RDF4J Workbench : <http://localhost:28887/rdf4j-workbench>
- MongoDB port : <http://localhost:28888>

## Stop docker stack

This command will stop the stack.

```bash
docker compose --env-file opensilex.env down
```

## Other tools or customizations

### (Optional) Add a gui for mongodb

This will start the mongo express server that helps you do explore your mongo data on port [localhost:28889](http://localhost:28889). You can also use your own robo3t or Mongo Compass App.

```bash
docker compose --env-file opensilex.env run --rm start_opensilex_stack_mongogui
```

![mongo-express-image](./images/mongo-express.png)

### (Optional) Add a reverse proxy

This will start the haproxy as reverse proxy for opensilex instance on port that you want to expose.

It can be configure in the `./opensilex.env` with the variable `HAPROXY_EXPOSED_PORT` (Default to port 80 equivalent to [localhost](http://localhost).

```bash
docker compose --env-file opensilex.env run --rm start_opensilex_stack_proxy
```

If you have installed [optional reverse proxy](#optional-add-a-reverse-proxy)

By default, different available services can be found at these adresses. The port might be change depending on your `./opensilex.env` configuration file.

- Web :
  - OpenSILEX web application : <http://localhost/opensilex/app>
  - OpenSILEX API : <http://localhost/opensilex/api-docs>
  - RDF4J Workbench : <http://localhost/rdf4j-workbench>
  - MongoDB port : <http://localhost:28888>

if you add installed [(Optional) Add a gui for mongodb](#optional-add-a-gui-for-mongodb)

- MongoDB express : <http://localhost/mongoadmin>

### Migration steps from previous versions

First, go to the previous directory and get the actual version of the repository.

```bash
# Go inside opensilex-docker-compose directory
git checkout 1.0.0-rc+5.2
```

#### From previous version 1.0.0-rc+5.1 (compose v1)

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

#### From previous version before 1.0.0-rc+5.1 (compose v1)

If you had a previous installation go to the directory where the project have been clone.
And execute the following command to remove previous docker stack :

```bash
# Remove old containers
docker stop mongodb && docker rm mongodb
docker stop opensilex && docker rm opensilex
docker stop rdf4j && docker rm rdf4j
```

## Customize docker configuration

Configure `opensilex.env` file to configure opensilex sparql config, applications ports, applications volumes

```bash
# CAN BE MODIFIED

# SPARQL
BASEURI=http://www.opensilex.org/
BASEURIALIAS=opensilex
REPOSITORIES_NAME=opensilex-docker-db
OPENSILEX_PATH_PREFIX=opensilex

# PORTS EXPOSED
HAPROXY_EXPOSED_PORT=80
OPENSILEX_EXPOSED_PORT=8081
RDF4J_EXPOSED_PORT=28887
MONGO_EXPOSED_PORT=28888
MONGO_EXPRESS_EXPOSED_PORT=28889
```

_TODO : Add exemples_
<span style="color:blue"><span style="color:blue">

## Manage docker

In order to manage your docker stack via an web interface, we suggest you to use [Portainer Community edition edition](https://docs.portainer.io/start/install/server/docker/linux#deployment)

![portainer-image](./images/portainer.png)

## Debug installation

This command will give you stack trace of the docker build.

```bash
docker compose --env-file opensilex.env build > docker_logs/debug.log
```

<span style="color:red">
 <h2>Danger Zone</h2>
</span>

### Stop docker stack and erase all data (Be sure to delete all data)

This command will give you stack trace of the docker build.

```bash
docker compose --env-file opensilex.env down --volumes
```

## Acknowledgments

Olivier Fangi & Co - [P2M2 Team](https://github.com/p2m2)

<base target="_blank">
