class User::TagsController < ApplicationController


  def index
    @recipes = Resipe.all
    #以下を追記
    if params[:tag_ids]
      @recipes = []
      params[:tag_ids].each do |key, value|
        @recipes += Tag.find_by(name: key).recipes if value == "1"
      end
      @recipes.uniq!
    end
  end

  def create
　　@tag = Tag.new(article_params)
    if @tag.valid?
      @tag.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def destroy

  end

 private

  def article_params
    params.require(:article).permit(:body, tag_ids: [])
  end

end
