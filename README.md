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
- [Ansible](https://www.ansible.com/)
- Kubernetes cluster
- [DockerHub](https://hub.docker.com/) account
- [Jenkins](https://www.jenkins.io/?src=sidebar) agent

### CI/CD
This project is suited for a jenkins pipeline, all you have to do is setting up your Jenkins agent whatever way you like and create a declarative [pipeline](https://www.jenkins.io/doc/pipeline/tour/hello-world/#:~:text=Jenkins%20Pipeline%20(or%20simply%20%22Pipeline,continuous%20delivery%20pipelines%20into%20Jenkins.&text=The%20definition%20of%20a%20Jenkins,a%20project's%20source%20control%20repository.) job and build from the Jenkinsfile in this repository.


### Using this project
1. Clone the repo
  ```sh
  git clone https://github.com/lolverae/warehouse_service.git
  ```

2. Run the ansible playbook inside the ansible folder, to build and push a docker image to DockerHub, indicating the name and version desired for the image
  ```sh
  cd warehouse_service/ansible
  ansible-playbook -i -e "image_name=[image_name]" -e "image_version=[imagr_version]" main.yml
  ```
3. Create a k8s secret with the variables used by the app
```sh
kubectl create secret generic db-user-pass \
--from-literal=username=admin \
--from-literal=password=password123
```
4. Go to the Kubernetes folder and deploy the cluster the apply command
```sh
cd warehouse_service/kubernetes/
kubectl apply -f api/,database/
```
5. Run the command to get the port where k8s is redirecting traffic to access the service
```sh
kubectl get svc
```



Included Scripts
----------------

To monitor the application create a script to check the HTTP status returned by the application, to do this we use the tool [curl](https://curl.se/docs/manual.html) in the script check_status.sh  
To install curl in debian based systems use the following command

   ```sh
   sudo apt install curl
   ```
There are two scripts to check the health of the containers:
  ```sh
  ./scripts/check_health.sh # Gets the HTTP status of both containers and lets you know if there is a problem with them
  ```
  
  ```sh
  ./scripts/check-stats.sh # Takes a snapshot to the current resource usage statistics for the containers running
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

