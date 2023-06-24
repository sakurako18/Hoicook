class SearchesController < ApplicationController
  # before_action :authenticate_user!

  def search
    @genres = Genre.all
    @range = params[:range]
    if @range == "Recipe"
      @recipes = Recipe.looks(params[:word]).page(params[:page])
    else
      @recipe_ingredients = RecipeIngredient.looks(params[:word])
      @recipes = Kaminari.paginate_array(@recipe_ingredients.map {|ingredient| ingredient.recipe}).page(params[:page])
    end
    render "user/recipes/index"
  end
end