# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).
 
## [1.4.9] - 2025-05-15

- Update Opensilex version to 1.4.9.  
  - See the [1.4.9 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.9)
  - See the [1.4.8 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.8)
- Update contributing documentation
- Update Mongo docker from 7.0.28 to 8.0.11
- Update Haproxy docker from 3.1.5 to 3.2
- Update RDF4J docker from 5.1.2 to 5.1.3-tomcat
- Update Opensilex docker base image from `9.0.99-jre11-temurin-jammy`
  to `tomcat:9.0.107-jre17-temurin-noble`
- Add `PROJECT_PREFIX` env file parameters in order to modify docker compose stack name. It allows to run two or more docker stack on the same server.
- Update dump scripts
- Update docker-compose.yml 

## [1.4.7] - 2025-05-15

- Update Opensilex version to 1.4.7. See the [1.4.7 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.7)
- Update contributing documentation

## [1.4.6] - 2025-04-05

These changes address potential vulnerabilities such as [CVE-2025-24813](https://nvd.nist.gov/vuln/detail/CVE-2025-24813) in the Docker Compose Stack environment.

- Update Opensilex version to 1.4.6 
  - See the [1.4.6 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.6)
  - See the [1.4.5 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.5)
  - See the [1.4.4 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.4)
- Update Opensilex docker base image from `9.0.98-jre11-temurin-jammy`
  to `tomcat:9.0.99-jre17-temurin-noble`
- Update RDF4J docker from 5.0.3 to 5.1.2
- Add a new OPENSILEX_TOMCAT_IMAGE_VERSION ARG requested in [#5 pull request](https://github.com/OpenSILEX/opensilex-docker-compose/issues/5)
- [See migration step](MIGRATION.md#from-144-version-to-146) 


## [1.4.4] - 2025-03-10

- Update Opensilex version to 1.4.4
  - See the [1.4.2 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.2)
  - See the [1.4.3 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.3)
  - See the [1.4.4 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.4)
- Update Mongo docker from 5.0.28 to 7.0.17
- Update Haproxy docker from 3.0.3 to 3.1.5 


## [1.4.1] - 2025-01-23

- Update Opensilex version to 1.4.1
  - See the [1.4.0 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.0)
  - See the [1.4.1 version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.4.1)
- Update Opensilex docker base image from `9.0.89-jre11-temurin-jammy`
  to `tomcat:9.0.98-jre17-temurin-noble`
- Update RDF4J docker from 3.7.7 to 5.0.3

## [1.3.3] - 2024-07-25

### Changed

- Update opensilex version to 1.3.3
- See the [version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.3.3)
- Update haproxy docker from 2.6.6 to 3.0.3
- Update mongo express from 1.0.0-alpha.4 to 1.0.2-20
  - Update documentation authentification is now required (see README)
- Update mongodb from 5.0.19 to 5.0.28

## [1.2.5] - 2024-05-15

### Changed

- Update opensilex version to 1.2.5
- See the [version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.2.5)

## [1.2.4] - 2024-04-17

### Changed

- Update opensilex version to 1.2.4
- See the [version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.2.4) for potential migration 
  instructions

## [1.2.3] - 2024-04-17

### Changed

- Update opensilex version to 1.2.3
- See the [version changelog](https://github.com/OpenSILEX/opensilex/releases/tag/1.2.3) for potential migration 
  instructions

## [1.2.2] - 2024-03-05

### Changed

- Update opensilex version to 1.2.2
- Merge [pull request](https://github.com/OpenSILEX/opensilex-docker-compose/pull/1) from [afabbri](https://github.com/afabbri) on mongo start test

## [1.2.1] - 2024-02-01

### Changed

- Update opensilex version to 1.2.1

## [1.2.0] - 2024-01-24

### Changed

- Update opensilex version to 1.2.0
- Add rdg module extension configuration

## [1.0.1] - 2023-07-20

### Changed

- Update opensilex version to 1.0.1
- Update mongo to version 5.0.19
## [1.0.0-rc+7.1] - 2023-03-30chang

### Changed

- Update opensilex version to 1.0.0-rc+7.1

## [1.0.0-rc+7] - 2023-03-30

### Changed

- Add parameter ``OPENSILEX_PUBLIC_URL`` for publicURL
- Update opensilex version to 1.0.0-rc+7
- Add first version of extra module management (sixtine, vitioeno)
- Add theme and custom configuration

## [1.0.0-rc+6] - 2022-12-19

### Changed

- Update opensilex version to 1.0.0-rc+6
- Upgrade Rdf4j to 3.7.7
- Upgrade MongoDB to 5.0.14
- Upgrade docker creation
- Add file system config file for local and gridfs filesystem
- Add opensilex user in docker container support for bind volumes
- Remove specific rdf4j build specification
- Update haproxy container name

## [1.0.0-rc+5.2] - 2022-10-25

### Changed

- Update opensilex version to 1.0.0-rc++5.2
- Upgrade docker instance
- Add environment config file

## [1.0.0-rc+5.1] - 2022-10-04

### Changed

- Update opensilex version to 1.0.0-rc++5.1

## [1.0.0-rc+4.1] - 2022-09-01

### Changed

- Add HAProxy container as reverse proxy
- Update Readme
- Downgrade opensilex version to 1.0.0-rc++3

## [1.0.0-rc+4.1] - 2022-09-01

### Changed

- Remove nginx container
- Update Readme
- Upgrade opensilex version to 1.0.0-rc++4.1
- Downgrade rdf4j version MacOS compatibility issue to from 3.7.6 to 3.7.4

## [1.0.0-rc+3.1] - 2022-06-08

### Added

First version of dockerfile
