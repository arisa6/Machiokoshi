class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin! 
  
  def index
    @item = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end
  
   def create
    @item = Item.new(item_params)
      if @item.save then
         flash[:notice] = '新しい商品を登録しました。'
         redirect_to admin_items_path(@item)
      else
         logger.debug @item.errors.inspect
         render new_admin_item_path
      end
   end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
      flash[:notice] = '商品情報を編集しました'
    else
      render :"edit"
    end
  end
  
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path, notice: "商品を削除しました。"
  end
  
  
  def item_params
  	params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :store, :image)
  end

end


