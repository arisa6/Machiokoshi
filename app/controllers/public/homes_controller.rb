class Public::HomesController < ApplicationController
  def top
    @item = Item.limit(4).order("created_at DESC")
    @items = Item.page(params[:page]).per(4)
  end
    
  def about
  end

end
