class Admin::OrdersController < ApplicationController
  
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = Order.find(@order_detail.order_id)
      case @order.status
      when "入金待ち"
        @order_details.update(making_status: 0)
      when "入金確認"
        @order_details.update(making_status: 1)
      when "製作中"
        @order_details.update(making_status: 2)
      when "発送準備中"
        @order_details.update(making_status: 3)
      end
  	
	  redirect_to  admin_order_path(@order)
  end
  
  
  def history
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: params[:id]).order(id: "DESC").page(params[:page])
  end
  
  
  def order_params
   params.require(:order).permit(:status)
  end
end