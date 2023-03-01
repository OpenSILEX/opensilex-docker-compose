# Minimalist opensilex docker compose environment

<!-- add _target to all external link -->
<head>
  <base target="_blank">
</head>

Docker compose environnent to deploy opensilex stack based on a previous work <a href="https://github.com/p2m2/opensilex-phis-igepp" target="_blank">opensilex-phis-igepp</a>.

- [Minimalist opensilex docker compose environment](#minimalist-opensilex-docker-compose-environment)
  - [Pre-requesite softwares](#pre-requesite-softwares)
  - [Check your installed softwares](#check-your-installed-softwares)
  - [Stack software name with associated versions](#stack-software-name-with-associated-versions)
  - [Installation steps](#installation-steps)
    - [Full dockerized version](#full-dockerized-version)
    - [Db dockerized version](#db-dockerized-version)

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
  - haproxy (web server used as reverse proxy) - 2.6.6

## Installation steps

This docker version is related to <a href="https://github.com/OpenSILEX/opensilex/releases/tag/1.0.0-rc%2B6.5" target="_blank">1.0.0-rc+6.5 OpenSILEX version</a>

### Full dockerized version

This respository includes opensilex full stack (proxy, opensilex, mongodb, mongo express, rdf4j) in dockerized version.


### Db dockerized version

This docker includes opensilex full stack ( opensilex, mongodb , rdf4j) in dockerized version and you are able to run java executable to manage opensilex.