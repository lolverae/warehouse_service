Warehouse Service
==================

> A microservice written in [Python3](https://www.python.org/download/releases/3.0/) for being used for a DevOps assessment.

Warehouse service: saves products by category and with a unique id in a NoSQL database, consult the existing products as many times as you want.

### Built with

- [Python3](https://www.python.org/download/releases/3.0/)
- [FastAPI](https://fastapi.tiangolo.com/)

Getting started
---------------

### Prerequisites

- [Docker](https://www.docker.com/)
- [Apache CouchDB](http://couchdb.apache.org)

### Using this project
1. Clone the repo
  ```sh
  git clone https://github.com/lolverae/warehouse_service.git
  ```

2. Run the convinience script and answer the prompts
  ```sh
  ./start.sh
  ```
The script will create a enviroment file named *.env* containing the credentials for couchdb and the port that is going to be used to check the app on localhost:
  ``` 
  COUCHDB_ADMIN=<your_username>
  COUCHDB_PASSWORD=<your_password>
  APP_PORT=<available_port>
  ```
<!-- 3. Run the following docker compose command
  ```sh
  docker compose up
  ``` -->


Included Scripts
----------------

To monitor the application create a script to check the HTTP status returned by the application, to do this we use the tool [curl](https://curl.se/docs/manual.html) in the script check_status.sh  
To install curl in debian based systems use the following command

   ```sh
   sudo apt install curl
   ```
There are two scripts to check the health of the containers:
  ```sh
  check_health.sh # Gets the HTTP status of both containers and lets you know if there is a problem with them
  ```
  
  ```sh
  check-stats.sh # Takes a snapshot to the current resource usage statistics for the containers running
  ```
  

Usage
-----
API Documentation [FastAPI](https://fastapi.tiangolo.com/)

When running the containers you can checkout the FastAPI UI interface to interact with the microservice
```
http://localhost:8000/
```

#### Add product
```
POST /v1/products/create_product
```
To add a product you can use the FastAPI UI to make a request or make a direct request using curl, the model we use to feed the API is:

```json
{
  "_id": "string",
  "category": "string",
  "prodname": "string",
  "quantity": 0
}
```

#### Get product
To add a product you can use the FastAPI UI to make a request or make a direct request using curl
```
GET /products/get_product/{prodId}
```

### Extra credits

#### Check if microservice/database is running and start it if it isn't:
For this you can run the docker compose file as a *stack*, for that we need to run the next command
```sh
docker stack deploy --compose-file docker-compose.yml warehouse
```
This makes use of the *deploy* part of the docker compose file, with the configuration we gave it, docker will create 2 replicas of each container and will restart any container that is stopped.


#### Upload the used docker images to Docker Hub:
You can find the docker image [here](https://hub.docker.com/repository/docker/lolverae/warehouse_service)


#### Automate the build and deployment of your application using a bash/shell script:

The great thing about docker is that the docker compose file already can do this for us!

