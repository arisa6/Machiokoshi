class Public::ItemsController < ApplicationController
 def index
  @genres = Genre.all
  @items = Item.where(is_active: true).page(params[:page]).per(4)
  @items_all = Item.all.where(is_active: true)
  # @item = Item.limit(4).order("created_at DESC")
 end

 def show
  @genres = Genre.all
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
 end
 
  def item_params
  	params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :store, :image)
  end
     
end
