class Public::FavoritesController < ApplicationController
    
    # def index
    #     favorites = Favorite.where(customer_id: current_customer.id).pluck(:item_id)
    #     @favorite_list = Item.find(favorites)
    # end
    
    def create
        @favorite = current_customer.favorites.create(item_id: params[:item_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @item = Item.find(params[:item_id])
        @favorite = current_customer.favorites.find_by(item_id: @item.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
