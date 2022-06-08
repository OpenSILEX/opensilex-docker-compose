

# Minimalist opensilex docker compose environment

Docker compose environnent to deploy opensilex stack based on a previous work environment variables [opensilex-phis-igepp](https://github.com/p2m2/opensilex-phis-igepp)

  - [Installation](#installation)
    - [Customize hostname](#customize-hostname)
    - [create an administrator user](#create-an-administrator-user)
## Installation

- Clone this repository :

```bash
 git clone https://github.com/OpenSILEX/opensilex-docker-compose
```
  
You must run docker compose up command :

```bash
docker-compose up
```

- Create an administrator user

```bash
docker exec -it opensilex ./bin/opensilex.sh user add --admin --email=admin@opensilex.org --lang=fr --firstName=firstName --lastName=lastName --password=admin
```
### Test application

Wait few seconds and try to load http://localhost/app  Opensilex application home page

By default, differents availables services can be found at these adresses :

- Web :
  - Opensilex application : http://localhost/app
  - RDF4J Workbench  :  http://localhost/rdf4j-workbench
- Internal :
  - MongoDB port : http://localhost:27017

### Customize config file

Configure config/opensilex.yml file to configure opensilex stack

### Customize hostname

Update host parameters if needeed on docker-compose.yml and  opensilex.env files.
*TODO*

#### Acknowledgments

Olivier Fangi & Co - [P2M2 Team](https://github.com/p2m2)