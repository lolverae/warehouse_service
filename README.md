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
  ```sh
  docker run --rm -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=pass -p 5984:5984 couchdb
  ```

### Installation
1. Clone the repo
   ```sh
   git clone https://github.com/andresr22/warehouse_service.git
 ```

Build
-----

Inside the folder with all the files related to the project create a Dockerfile to describe the image of the Python app.

To create the two services at the same time
1. Create a docker-compose.yml file




Monitoring
----------
To monitor the application create a script to check the HTTP status returned by the application, to do this we use the tool [curl](https://curl.se/docs/manual.html) in the script check_status.sh  
To install curl in debian based systems use the following command

   ```sh
   sudo apt install curl
   ```
There are two scripts to check the health of the containers:
  check_health.sh gets the HTTP status of both containers and lets you know if there is a problem with them
  check-stats.sh takes a snapshot to the current resource usage statistics for the containers running

Usage
-----
API Documentation [FastAPI](https://fastapi.tiangolo.com/)
```
http://localhost:8000/
```

### Add product
```
POST /v1/products/create_product
```
```json
{
  "_id": "string",
  "category": "string",
  "prodname": "string",
  "quantity": 0
}
```

### Get product

```
GET /products/get_product/{prodId}
```

