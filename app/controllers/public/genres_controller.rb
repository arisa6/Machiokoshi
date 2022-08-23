class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @items = @genre.items.where(is_active: true) #where条件に合致するオブジェクトを配列として取り出す
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  
  private
  def item_params
  	params.require(:item).permit(:name, :image)
  end
  
  def item_params
  	params.require(:genre).permit(:name)
  end
end
