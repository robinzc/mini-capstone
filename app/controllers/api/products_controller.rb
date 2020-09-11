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
      name: params[:name],
      price: params[:price],
      image_path: params[:image_path],
      description: params[:description]
    )
    @product.save
    render "show.json.jb"
  end
  # In backend, pass the POST key-value pairings through Insomnia

  def update
    @product = Product.find_by(params[:id])

    @product.name = params[:name],
    @product.price = params[:price],
    @product.image_path = params[:image_path],
    @product.description = params[:description]

    @product.save
    render "show.json.jb"
  end
  # In backend, pass the PATCH key-value pairings through Insomnia
  # If you don't pass something in the params hash, you're overriding the existing code with `null`

end

