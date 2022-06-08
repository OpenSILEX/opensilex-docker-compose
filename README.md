

# Minimalist opensilex docker compose environment
Docker compose environnent to deploy opensilex stack based on a previous work environment variables [opensilex-phis-igepp](https://github.com/p2m2/opensilex-phis-igepp)

  - [Installation](#installation)
    - [Customize hostname](#customize-hostname)
    - [create an administrator user](#create-an-administrator-user)
## Installation

Clone this repository

Configure config/opensilex.yml file to configure opensilex stack

By default, differents services can be found at these adresses

Opensilex application : http://localhost/app
RDF4J Workbench :  http://localhost/rdfbench

### Customize hostname

Update host parameters if needeed on docker-compose.yml and  opensilex.env files
 
### create an administrator user

docker exec -it opensilex ./bin/opensilex.sh user add --admin --email=admin@opensilex.org --lang=fr --firstName=firstName --lastName=lastName --password=admin

#### Acknowledgments :

Olivier Fangi & Co - [P2M2 Team](https://github.com/p2m2)