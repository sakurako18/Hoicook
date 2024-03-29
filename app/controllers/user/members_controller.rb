class User::MembersController < ApplicationController
  before_action :authenticate_user!, onry: [:show, :edit, :update], unless: :devise_controller?

  def show
    @user = current_user
    @comments = Comment.where(user_id: @user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update!(user_params)
       redirect_to member_path(@user)
    else
        render 'edit'

    end
  end

private
  def user_params
      params.require(:user).permit(:last_name, :first_name, :email, :user_name, :is_deleted)
  end

end
