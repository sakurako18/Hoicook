class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!, onry: [:index, :create, :edit, :update, :destroy], unless: :devise_controller?

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    flash[:notice] = "新しいジャンルを追加しました。"
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    flash[:notice] = "ジャンルを更新しました。"
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "ジャンルを削除しました。"
    redirect_to admin_genres_path
  end

private

  def genre_params
     params.require(:genre).permit(:name)
  end
end
