class User::FavoritesController < ApplicationController

  def favorite_recipes
    @user = User.find(params[:id])
    posts = @user.favorited_posts
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
    render user_favorite_recipes_path
  end

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

end
