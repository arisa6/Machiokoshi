class Public::OrdersController < ApplicationController
 def index
  @orders = Order.all
  @order = current_customer.orders
 end
 
 def show
  @order = Order.find(params[:id])
  # @order_details = @order.order_details
  # @customer = current_customer
 end
 
 def new
  @customer = current_customer
  @order = Order.new
  @addresses = current_customer.address
 end
 
 def create
  @order = Order.new(order_params)
  cart_item = current_customer.cart_item.all
  @order.postage = 800
  @order.save
  @order.current_id = current_customer.id
   current_customer.cart_item.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.item_id = cart_item.item_id
    @order_detail.price = cart_item.item.price
    @order_detail.amount = cart_item.amount
    @order_detail.save
   end
    cart_item.destroy_all
    redirect_to complete_public_orders_path
 end
 
 def confirm
  @customer = current_customer
  @cart_items = CartItem.all
  @order = Order.new(order_params)
  @total = 0
  @order.customer_id =current_customer.id
    if params[:order][:select_address]=="0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address]=="1"
       @address= Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
       @order.payment_method = params[:order][:payment_method]
    elsif params[:order][:select_address] = "2"
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
    end
 end
 
 def complete
 end
 
 
 private
  def order_params
    params.require(:order).permit(:parameters, :postal_code,:payment_method,:customer_id, :address, :name, :billing_amount, :postage, :status)
  end
end
