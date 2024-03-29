# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, only: [:create]

  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to recipes_path, notice: 'ゲストユーザーとしてログインしました'
  end

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
     # Guestユーザーのメールアドレスが変更になった場合は、以下を編集
     current_user.recipes.destroy_all if current_user.email == "aaa@aaa.com"
     current_user.favorites.destroy_all if current_user.email == "aaa@aaa.com"
     current_user.comments.destroy_all if current_user.email == "aaa@aaa.com"
     super
   end

  def after_sign_in_path_for(resource)
    recipes_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
