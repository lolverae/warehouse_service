from typing import Optional
from fastapi import FastAPI
from productProviders import ProductProvider
from pydantic import BaseModel

app = FastAPI()
data_provider=ProductProvider()

class Product(BaseModel):
    id: str
    category: str
    prodname: str
    quantity: int


@app.get("/")
def root():
    return {"Bonjour": "🍕"}

@app.get("/read_product/{prodId}")
def read_product(prodId: str):
    return data_provider.read_product(prodId)

@app.post("/create_product")
def create_product(product: Product):
    return data_provider.create_product(product)
