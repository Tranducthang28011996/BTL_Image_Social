class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def is_admin
    redirect_to root_path if current_user.role == 0
  end

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end

  def set_search
    @q = User.search(params[:q])
    @user_search = @q.result(distinct: true)
    if @user_search.size == 1
      redirect_to user_url(@user_search.first)
    end
  end
end

