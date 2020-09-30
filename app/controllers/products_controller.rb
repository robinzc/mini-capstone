class ProductsController < ApplicationController

  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: 2
    )
    puts "=============================== #{@product.errors.full_messages}"
    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find(params[:id])
    render "show.html.erb"
  end

  def edit
    @product = Product.find(params[:id])
    render "edit.html.erb"
  end


end
