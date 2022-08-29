class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_postage = 800 #送料
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if @order.status == "payment_confirmation"
         @order_details.update_all(making_status: "work_wait")
      end
      redirect_to admin_order_path
      flash[:notice] = 'ステータスを更新しました。'
    else
     render :show
     flash[:notice] = '対応ステータスを更新できませんでした。'
    end
  end
  
  
  def history
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: params[:id]).order(id: "DESC").page(params[:page])
  end
  
  
  private
  
   def order_params
    params.require(:order).permit( :making_status, :status, :postal_code, :total_payment, :billing_amount )
   end
   def order_details_params
    params.require(:order_detail).permit( :item, :price, :amount, :making_status )
   end
end
