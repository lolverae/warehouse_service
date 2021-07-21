import couchdb
import os
from couchdb import http
from dotenv import load_dotenv

load_dotenv()
ADMIN_USERNAME = os.environ.get("COUCHDB_USER")
ADMIN_PASSWORD = os.environ.get("COUCHDB_PASSWORD")
#COUCHDB_HOST = os.environ.get("COUCH_HOST")
#COUCHDB_PORT = os.environ.get("COUCH_PORT")
COUCHDB_URL = 'http://{}:{}@couch:5984/'.format(ADMIN_USERNAME, ADMIN_PASSWORD)

couch = couchdb.Server(COUCHDB_URL)

class ProductProvider(object):
    
    def create_product(self, payload):
        # print(type(payload))
        try:
            db = couch['products']
        except http.ResourceNotFound:
            db = couch.create('products')
        if payload.id in db:
            return { "error": "An existing item already exists" }, 409
        else:
            db.save({
                "_id": payload.id,
                "category": payload.category,
                "prodname": payload.prodname,
                "quantity": payload.quantity
            })
            return payload, 201
    
    def read_product(self, prodId) -> str:
        db = couch['products']
        if prodId in db:
            product = db[prodId]
            return product, 200
        else:
            return { "error": "A product with the specified ID was not found" }, 400
