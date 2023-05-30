class User::MembersController < ApplicationController

before_action :authenticate_user!

  def show
    @users = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_member_path
    else
        render 'edit'
    end
  end

  def unsubscribe

  end

  def withdraw
    @user = current_user

    @user.update(is_deleted: true)
    reset_session

    redirect_to root_path
  end

private
  def user_params
      params.require(:user).permit(:last_name, :first_name, :email, :user_name, :is_deleted)
  end

end
