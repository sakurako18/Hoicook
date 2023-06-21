class SearchesController < ApplicationController
  # before_action :authenticate_user!

  def search
    @genres = Genre.all
    @range = params[:range]
    if @range == "Recipe"
      @recipes = Recipe.looks(params[:word]).page(params[:page])
    else
      @recipe_ingredients = RecipeIngredient.looks(params[:word]).page(params[:page])
      @recipes = @recipe_ingredients.map {|ingredient| ingredient.recipe}
    end
    render "user/recipes/index"
  end
end