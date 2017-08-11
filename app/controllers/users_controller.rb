class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_exists_user?
  # before_action :params_password, only: :update
  before_action :check_exists_user?, except: :index
  # before_filter :search
  def index

  end

  def show

  end

  def edit
    render json: {
      form_edit_avatar: render_to_string(partial: "edit_avatar", locals:{user: @user})
    }
  end

  def edit_infor

  end

  def update
    if params_password[:password].present?
      if  current_user.valid_password? params_password[:password_old]
        @user.update_attributes params_password
        redirect_to  root_url
      else
        flash[:danger] = "Password is not exists?"
      end
    else
      @user.update_attributes params_user
    end
    redirect_to profile_path(current_user)
  end

  def edit_profile
    @user = User.find_by id: params[:id]
  end

  private

  def check_exists_user?
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user
  end

  def params_user
    params.require(:user).permit :avatar, :username, :email
  end

  def params_password
    params.require(:user).permit :password, :password_confirmation, :password_old
  end
end
