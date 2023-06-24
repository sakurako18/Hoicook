class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, only: [:top], unless: :devise_controller?

  def top
    @comments = Comment.page(params[:page])
  end

end
