class Admin::OdersController < ApplicationController
  def show
  end

  def update
  end
  
  
  def history
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: params[:id]).order(id: "DESC").page(params[:page]) 
  end
  
  
  def order_params
   params.require(:order).permit(:status)
  end
end
