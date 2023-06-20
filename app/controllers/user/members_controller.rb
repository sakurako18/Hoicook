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
       redirect_to user_member_path(@user)
    else
        render 'edit'
    end
  end
  
  def destroy

  end


private
  def user_params
      params.require(:user).permit(:last_name, :first_name, :email, :user_name, :is_deleted)
  end

end
