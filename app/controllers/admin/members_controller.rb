class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!, onry: [:index, :edit, :show, :update], unless: :devise_controller?

  def index
    @users = User.all
    @user = User.page(params[:page])
  end

  def edit
    @users = User.all
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_member_path(@user.id)
  end


private
  def user_params
      params.require(:user).permit(:last_name, :first_name, :user_name, :email, :is_deleted)
  end

end