class User::RecipesController < ApplicationController


  def index
    @recipes = Recipe.where(post_status: true).page(params[:page])
    @genres = Genre.all
    if params[:genre_ids]
      @recipes = @recipes.where(genre_id: params[:genre_ids])
    end

    if params[:tag_ids]
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_recipes = Tag.find_by(name: key).recipes
          @recipes = @recipes.empty? ? tag_recipes : @recipes & tag_recipes
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

      #tag_idの取得
      tag_ids = params[:recipe][:tag_ids]

    if @recipe.valid?
       @recipe.save
        tag_ids.each do |tag_id|
          RecipeTagRelation.create(recipe_id: @recipe.id, tag_id: tag_id)
        end
      redirect_to user_recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @comment = Comment.new(recipe_id: @recipe.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    unless @recipe.user.id == current_user.id
      redirect_to root_path
    return
    end
    @recipe.update(recipe_params)
    @recipe.recipe_tag_relations.destroy_all
    tag_ids = params[:recipe][:tag_ids]
      tag_ids.each do |tag_id|
        RecipeTagRelation.create(recipe_id: @recipe.id, tag_id: tag_id)
      end
    redirect_to user_recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
      unless current_admin.id
        redirect_to root_path
      return
      end
    @recipe.destroy
    if current_user == @user
     redirect_to user_user_index_path
    else
     redirect_to admin_recipes_path
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:image, :name, :introduction, :number_of_people, :how_to_make, :genre_id, :post_status,
                                  recipe_ingredients_attributes:[:id, :ingredient, :ingredient_amount, :_destroy])
  end

end