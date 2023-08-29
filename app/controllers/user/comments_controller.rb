class User::CommentsController < ApplicationController
  before_action :authenticate_check, except: [:create, :destroy]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = current_user.comments.new(comment_params)
    @comment.recipe_id = @recipe.id
    @comment.save
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end


  private

  def authenticate_check
    return if admin_signed_in?
    return if user_signed_in?
    authenticate_user!
  end

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id)
  end

end
