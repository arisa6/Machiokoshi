class Public::OrdersController < ApplicationController
 def index
  @orders = Order.all
  @order = current_customer.orders
 end
 
 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  @customer = current_customer
 end
 
 def new
  @customer = current_customer
  @cart_items = current_customer.cart_items
  @order = Order.new
  @addresses = current_customer.address
 end
 
 def create
  cart_items = current_customer.cart_items.all #ログインユーザーのカートアイテムを全て取り出す。
  @order = current_customer.orders.new(order_params) #紐づけされて値を @order にいれる
  # @order.postage = 800
   if @order.save
   cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cart.amount
      order_detail.price = cart.item.price
      order_detail.save
   end
    redirect_to complete_public_orders_path
    cart_items.destroy_all
   else
    @order = Order.new(order_params)
    render :new
   end
 end
 
 def confirm
  @customer = current_customer
  @cart_items = CartItem.all
  @order = Order.new(order_params)
  @total = 0
  @order.customer_id =current_customer.id
    if params[:order][:address]=="0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address]=="1"
       @address= Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
       @order.payment_method = params[:order][:payment_method]
    elsif params[:order][:address] = "2"
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
    end
 end
 
 def complete
 end
 
 
 private
  def order_params
    params.require(:order).permit(:parameters, :postal_code,:payment_method,:customer_id, :amount, :address, :name, :postage, :status)
  end

end
