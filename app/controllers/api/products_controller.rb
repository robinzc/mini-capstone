class Api::ProductsController < ApplicationController
  def display_all_products
    @all_products = Product.all
    render "display_all_products.json.jb"
  end
end
