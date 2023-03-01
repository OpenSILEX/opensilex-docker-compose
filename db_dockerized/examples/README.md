# VITIS EXPLORER

## Run minimal opensilex docker stack compose

- With a bash terminal go to the project directory (where this readme is located).
 
- You must run docker compose up command to start your installation:

```bash
docker compose --env-file env_examples/vitisexplorer.env build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
docker compose --env-file env_examples/vitisexplorer.env run --rm start_opensilex_stack
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
sleeping
sleeping
[wait until it starts]
```

This previous action will block your terminal. When the terminal will be accessible again the opensilex app process will be started and ready.

```bash
sh opensilex_examples/vitis-explorer/opensilex.sh server start --host=localhost --port=8081 --adminPort=4081 --DEBUG
sh opensilex_examples/vitis-explorer/opensilex.sh system install

```