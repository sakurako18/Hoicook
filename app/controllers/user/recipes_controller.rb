class User::RecipesController < ApplicationController

  def index
    @recipes = Recipe.where(post_status: true).page(params[:page])
    @genres = Genre.all
    # if params[:genre_id]
    #   @genre =Genre.find(params[:genre_id])
    # @recipe = @genre.racipe.page(params[:page])
    # end
    if params[:tag_ids]
      @recipes = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_tweets = Tag.find_by(name: key).tweets
          @recipes = @recipes.empty? ? tag_tweets : @recipes & tag_tweets
        end
      end
    end
  end

  def user_index
    @recipes = Recipe.where(user_id: current_user).page(params[:page])

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

  def article_params
    params.require(:article).permit(:body, tag_ids: [])
  end

end