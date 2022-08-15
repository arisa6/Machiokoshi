class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin! (ログイン済ユーザーのみにアクセスを許可する)
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
      flash[:notice] = '新しい商品を登録しました。'
    else
    render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item.id)
      flash[:notice] = '商品情報を編集しました'
    else
      render :"show"
    end
  end
  
  
  def item_params
  	params.permit(:name, :introduction, :genre_id, :price, :is_active, :store, :image)
  end

end


