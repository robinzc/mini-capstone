class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:title],
      price: params[:price],
      image_path: params[:image_path],
      description: params[:description],
    )
    @recipe.save
    render "show.json.jb"
  end
# In backend, pass the key-value pairings through Insomnia
end

