class Public::FavoritesController < ApplicationController
    
    def create
        item = Item.find(params[:item_id])
        favorite = current_customer.favorites.new(item_id: item.id)
        # favorite.save
        # redirect_to items_path(item)
        if favorite.save
         redirect_to items_path(item)
        else
         redirect_to items_path(item)
         flash[:notice] = "お気に入り登録に失敗しました"
        end
    end
    
    def destroy
        item = Item.find(params[:item_id])
        favorite = current_customer.favorites.find_by(item_id: item.id)
        favorite.destroy
        redirect_to items_path(item)
    end
    
    
    private
    
    def favorite_params
  	    params.require(:favorite).permit(:item_id, :customer_id)
    end
    
    def item_params
       params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :store, :image)
    end
    
    def customer_params
       params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
    end

end
