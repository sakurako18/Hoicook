class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy], unless: :devise_controller?

  def index
    @recipes = Recipe.page(params[:page])

  end

  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build
    ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @genres = Genre.all
  end

  def create
      @recipe = Recipe.new(recipe_params)
      @recipe.user_id = current_user.id
      @genres = Genre.all
    if @recipe.valid?
      @recipe.save
    redirect_to admin_recipe_path(@recipe.id)
    else
    render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to admin_recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:how_to_make, :image, :name, :introduction, :number_of_people, :how_to_make, :genre_id, :post_status,
                                  recipe_ingredients_attributes:[:ingredient, :ingredient_amount, :_destroy])
  end

end
