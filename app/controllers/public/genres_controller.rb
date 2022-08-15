class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @items = @genre.item.where(is_active: true) #where条件に合致するオブジェクトを配列として取り出す
    @genres = Genre.all
  end
end
