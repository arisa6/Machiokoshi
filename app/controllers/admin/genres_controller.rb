class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
     @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path #編集一覧に戻る
      flash[:notice] = '新しいジャンルを登録しました。'
    else
      @genres = Genre.all
      flash[:notice] = '新しいジャンルを登録しました。'
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルが変更されました。"
    else
      render :edit
    end
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    flash[:notice] = "ジャンルを削除しました。"
    redirect_to admin_genres_path  #編集一覧に戻る
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
