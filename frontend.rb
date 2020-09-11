require "http"

#All products
response = HTTP.get("http://localhost:3000/api/products")
products = response.parse
pp products

#Single product
response = HTTP.get("http://localhost:3000/api/products(id)")
products = response.parse
pp products