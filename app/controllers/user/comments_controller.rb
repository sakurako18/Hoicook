class User::CommentsController < ApplicationController

  def create
    # post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(comment_params)
    # comment.post_image_id = post_image.id
    comment.save
    redirect_to user_recipe_path(recipe_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
