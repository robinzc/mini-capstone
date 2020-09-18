class Supplier < ApplicationRecord
 
#Multiple products can be associated with the same supplier, so the method name is plural because you're expecting an array of products.

#long-hand
  # def products
  #   Product.where(supplier_id: id)  
  # end

  has_many :products

# Supplier table does not hold data about which products it holds; only product table contains information about suppliers

#Call supplier.products (same way we'd call an attribute reader, it's just an association method we wrote)
end
