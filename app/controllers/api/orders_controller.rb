class Api::OrdersController < ApplicationController

  before_action :authenticate_user
  #This means before actions in this controller are run, run the authenticate_user method

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  # def create
  #   @order = Order.new(
  #       user_id: current_user.id,
  #       product_id: params[:product_id],
  #       quantity: params[:quantity]
  #     )
  #   @order.subtotal = @order.quantity * @order.product.price
  #   #note order quantity params wouldn't work here because params are always strings
  #   @order.tax = @order.subtotal * 0.09
  #   @order.total = @order.tax + @order.subtotal
  def create
    carted_products = current_user.carted_products.where(status: "carted")
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    if @order.save 
      carted_products.update_all(status: "purchased", order_id: @order.id)
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
