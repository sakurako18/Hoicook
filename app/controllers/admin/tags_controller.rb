class Admin::TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy

  end

 private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
