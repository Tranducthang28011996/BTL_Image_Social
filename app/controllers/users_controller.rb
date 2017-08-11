class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_exists_user?, except: :index

  def index

  end
  def show

  end

  def edit
    render json: {
      form_edit_avatar: render_to_string(partial: "edit_avatar", locals:{user: @user})
    }
  end

  def update
    @user.update_attributes avatar: params[:user][:avatar]
  end

  private

  def check_exists_user?
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user
  end
end
