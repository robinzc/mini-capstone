require "http"

#All products
response = HTTP.get("http://localhost:3000/api/all_products")
products = response.parse
pp products

#Single product
response = HTTP.get("http://localhost:3000/api/head_massager")
products = response.parse
pp products