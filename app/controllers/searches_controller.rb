class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Recipe"
      @recipes = Recipe.looks(params[:search], params[:word])
    else
      @recipe_ingredients = RecipeIngredient.looks(params[:search], params[:word])
    end
  end
end