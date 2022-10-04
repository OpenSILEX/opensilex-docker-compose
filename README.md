
# Minimalist opensilex docker compose environment

Docker compose environnent to deploy opensilex stack based on a previous work environment variables [opensilex-phis-igepp](https://github.com/p2m2/opensilex-phis-igepp)

- [Minimalist opensilex docker compose environment](#minimalist-opensilex-docker-compose-environment)
  - [Installation](#installation)
    - [Clone the Github repository](#clone-the-github-repository)
    - [Run docker stack compose command](#run-docker-stack-compose-command)
    - [Create an administrator user](#create-an-administrator-user)
    - [Add a reverse proxy (Optional)](#add-a-reverse-proxy-optional)
    - [Add a gui for mongodb (Optional)](#add-a-gui-for-mongodb-optional)
    - [Test application containers and volumesry to load <http://localhost:8081/opensilex/app> Opensilex application home page](#test-application-containers-and-volumesry-to-load-httplocalhost8081opensilexapp-opensilex-application-home-page)
      - [Without reverse proxy](#without-reverse-proxy)
      - [With reverse proxy](#with-reverse-proxy)
    - [Debug installation](#debug-installation)
    - [Stop docker stack](#stop-docker-stack)
    - [Stop docker stack and erase all data (Be sure to delete all data )](#stop-docker-stack-and-erase-all-data-be-sure-to-delete-all-data-)
    - [Customize docker port](#customize-docker-port)
    - [Customize config file](#customize-config-file)
    - [Customize hostname](#customize-hostname)
  - [Manage docker](#manage-docker)
  - [Acknowledgments](#acknowledgments)

## Installation

This docker version is related to [1.0.0+rc+5.1 OpenSILEX version](https://github.com/OpenSILEX/opensilex/releases/tag/1.0.0-rc%2B5.1).

###  Clone the Github repository

```bash
git clone --branch 1.0.0-rc+5.1 https://github.com/OpenSILEX/opensilex-docker-compose
```

### Run docker stack compose command

- Go to  the following directory

```bash
cd opensilex-docker-compose
```

- You must run docker compose up command to start your installation:

```bash
docker-compose run --rm start_opensilex_stack
```

- Expected Output:

```bash
Creating network "opensilex-docker-compose_default" with the default driver
Creating volume "opensilex-docker-compose_persist_rdf4j_data" with default driver
Creating volume "opensilex-docker-compose_persist_mongo_data" with default driver
Creating volume "opensilex-docker-compose_persist_opensilex" with default driver
Creating volume "opensilex-docker-compose_haproxy_conf" with default driver
Creating mongodb ... done
Creating rdf4jdb ... done
Creating opensilexapp ... done
Waiting for mongo to listen on 27017...
Waiting for rdf4j to listen on 8080...
Waiting for opensilex to listen on 8081...
sleeping 
[until it stars]
```

### Create an administrator user

```bash
docker exec -it opensilexapp ./bin/opensilex.sh user add --admin --email=admin@opensilex.org --lang=fr --firstName=firstName --lastName=lastName --password=admin
```

### Add a reverse proxy (Optional)

This will start the haproxy as reverse proxy for opensilex instance on port 80

```bash
docker-compose run --rm start_opensilex_stack_proxy
```

### Add a gui for mongodb (Optional)

This will start the mongo express server that helps you do explore your mongo data on port 28018. You can also use your own robo3t or Mongo Compass App.

```bash
docker-compose run --rm start_opensilex_stack_mongogui
```

### Test application containers and volumesry to load <http://localhost:8081/opensilex/app> Opensilex application home page

By default, differents availables services can be found at these adresses :

####  Without reverse proxy

If you haven't installed [reverse proxy](#add-a-reverse-proxy-optional)

- Web :
  - Opensilex web application : <http://localhost:8081/opensilex/app>
  - Opensilex API :  <http://localhost:8081/opensilex/api-docs>
  - RDF4J Workbench  : <http://localhost:8080/rdf4j-workbench>
  - MongoDB port : <http://localhost:27017>
  - MongoDB express : <http://localhost:28018>

####  With reverse proxy

If you have installed [reverse proxy](#add-a-reverse-proxy-optional)

- Web :
  - Opensilex web application : <http://localhost/opensilex/app>
  - Opensilex API : <http://localhost/opensilex/api-docs>
  - RDF4J Workbench  : <http://localhost/rdf4j-workbench>
  - MongoDB port : <http://localhost:27017>
  - MongoDB express : <http://localhost:28018>

### Debug installation 

This command will give you stack trace of the docker build.
```bash
docker-compose up --build --force-recreate > debug.log
```
### Stop docker stack

This command will stop the stack.

```bash
docker-compose down
```
### Stop docker stack and erase all data (Be sure to delete all data )

This command will give you stack trace of the docker build.

```bash
docker-compose down --volumes
```
### Customize docker port

Configure  ``docker-compose.yml`` file to configure opensilex stack ports
*TODO : Add exemples*

### Customize config file

Configure config/opensilex.yml file to configure opensilex stack
*TODO : Add exemples*

### Customize hostname

Update host parameters if needeed on docker-compose.yml and  opensilex.env files.
*TODO*

## Manage docker

In order to manage your docker stack via an web interface, we suggest you to use [Portainer CE edition](https://docs.portainer.io/start/install?_ga=2.152302650.2059608137.1662022383-1714209046.1662022383)

## Acknowledgments

Olivier Fangi & Co - [P2M2 Team](https://github.com/p2m2)
