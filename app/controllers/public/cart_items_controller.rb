class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
     flash[:notice] = "You have updated user successfully."
     redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    @new_cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: @new_cart_item.item.id)
      @cart_item = current_customer.cart_items.find_by(item_id: @new_cart_item.item.id)
      @cart_item.amount += @new_cart_item.amount
      @cart_item.save
    else
      @new_cart_item.save
    end
    redirect_to public_cart_items_path
   
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :image,)
  end
  
end
