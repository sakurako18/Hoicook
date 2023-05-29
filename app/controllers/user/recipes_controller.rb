class User::RecipesController < ApplicationController

  def index
    @recipes = Recipe.where(post_status: true).page(params[:page])
    #@recipe = Recipe.all

  end

  def user_index
    @recipes = Recipe.page(params[:page])
    @genres = Genre.all
  end

  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
    #@how_to_makes = @recipe.how_to_makes.build
    @genres = Genre.all
  end

  def create
      @recipe = Recipe.new(recipe_params)
      # filtering ingredients with empty attaribute ingredient and ingredient_amount
      @recipe.recipe_ingredients = @recipe.recipe_ingredients.filter{|ingredient| ingredient.ingredient.present? && ingredient.ingredient_amount.present? }
      @recipe.user_id = current_user.id
      @genres = Genre.all
    if @recipe.valid?
      @recipe.save
      redirect_to user_recipe_path(@recipe.id)
    else
      render :new
    end

  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to user_recipe_path(@recipe.id)
  end

  def destroy

  end

  private
  def recipe_params
    params.require(:recipe).permit(:image, :name, :introduction, :number_of_people, :how_to_make, :genre_id, :post_status,
                                  recipe_ingredients_attributes:[:id, :ingredient, :ingredient_amount, :_destroy])
  end


end