class User::FavoritesController < ApplicationController
  before_action :authenticate_user!, onry: [:create, :destroy], unless: :devise_controller?

  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: @recipe.id)
    favorite.save!
    redirect_to user_recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy!
    redirect_to user_recipe_path(@recipe)
  end

  def favorite_recipes
    @user = current_user
    favorite_ids = @user.favorites.pluck(:recipe_id)
    @recipes = Recipe.where(id: favorite_ids).page(params[:page]).per(10)
  end

end
