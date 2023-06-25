class User::CommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :destroy], if: :admin_signed_in?
  before_action :authenticate_user!, only: [:create, :destroy], if: :user_signed_in?

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = current_user.comments.new(comment_params)
    @comment.recipe_id = @recipe.id
    @comment.save
    redirect_to user_recipe_path(@recipe.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to user_recipe_path(params[:recipe_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id)
  end

  # def authenticate_admin!
  #   p("called admin")
  #   super
  # end

  # def authenticate_user!
  #   p("called user")
  #   super
  # end


end
