class Api::OrdersController < ApplicationController

  before_action :authenticate_user
  #This means before actions in this controller are run, run the authenticate_user method

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity]
      )
    @order.subtotal = @order.quantity * @order.product.price
    #note order quantity params wouldn't work here because params are always strings
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.tax + @order.subtotal
    if @order.save #happy path
      render "show.json.jb"
    else #sad path
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    render "show.json.jb"
  end
end
