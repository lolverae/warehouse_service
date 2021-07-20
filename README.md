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
2. 
3. 


Included Scripts
----------------
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

