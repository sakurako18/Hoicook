class Admin::TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.valid?
      @tag.save
      flash[:alert] = "新しいタグを追加しました。"
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:alert] = "タグを削除しました。"
    redirect_to admin_tags_path
  end

 private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
