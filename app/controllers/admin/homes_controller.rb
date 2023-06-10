class Admin::HomesController < ApplicationController

  def top
    @comments = Comment.page(params[:page])
  end

end
