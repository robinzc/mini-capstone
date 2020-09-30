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
      supplier_id: params[:supplier_id]
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

  def update
    @product = Product.find(params[:id])
    if @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
      redirect_to "/products/#{@product.id}"
    else 
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to "/products"
  
  end

end
