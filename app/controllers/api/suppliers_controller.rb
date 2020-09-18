class Api::SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all 

    if params[:search]
      @suppliers = @suppliers.where("name iLIKE ?", "%#{params[:search]}%")
    end 

    render "index.json.jb"
  end

  def show
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    render "show.json.jb"
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if @supplier.save #happy path
      render "show.json.jb"
    else #sad path
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end
  # In backend, pass the POST key-value pairings through Insomnia

  def update
    @supplier = Supplier.find(params[:id])

    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
  
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end

  end
  # In backend, pass the PATCH key-value pairings through Insomnia
  # If you don't pass something in the params hash, you're overriding the existing code with `null` -- use || to selectively update.

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    render json: {message: "Supplier successfully destroyed!"}
  end
end
