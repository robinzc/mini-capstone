class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product
      .name_search(params[:search])
      .discounted(params[:discount])
      .sorted(params[:sort], params[sort_order])

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
    render "index.json.jb"
  end
  
    # if params[:search]
    #   @products = @products.where("name iLIKE ?", "%#{params[:search]}%")
    # end 

    # if params[:discount]
    #   @products = @products.where("price < ?", 10)
    # end

    # if params[:sort] == "price"
    #   if params[:sort_order] == "desc"
    #     @products = @products.order(price: :desc) 
    #   else
    #     @products = @products.order(:price)
    #   end
    # else
    #   @products = @products.order(:id)
    # end
    

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory]
    )
    if @product.save #happy path
      render "show.json.jb"
    else #sad path
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end
  # In backend, pass the POST key-value pairings through Insomnia

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.inventory = params[:inventory] || @product.inventory

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end

  end
  # In backend, pass the PATCH key-value pairings through Insomnia
  # If you don't pass something in the params hash, you're overriding the existing code with `null` -- use || to selectively update.

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product successfully destroyed!"}
  end

end

