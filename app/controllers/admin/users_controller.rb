class Admin::UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    render layout: "admin/application"
  end

  def show
    @user_comments = user.comments.paginate(:page => params[:comment_page], per_page: 10)
    @user_photos = user.photos.paginate(:page => params[:photo_page], per_page: 6)
    render layout: "admin/application"
  end

  def edit
    render layout: "admin/application"
  end

  def update
    if user.update_attributes user_params
      return redirect_to admin_users_path
    end
    render :edit
  end

  private

  attr_reader :user

  def find_user
    @user = User.find params[:id]
    redirect_to admin_users_path unless user
  end

  def user_params
    params.require(:user).permit :username, :email
  end
end
