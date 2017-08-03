class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_photos = current_user.photos.build
    @new_comment = @new_photos.comments.build

    @photos = current_user.photos.includes(:user, :comments)
  end

  def new
  end

  def create
    if current_user.photos.create photo_params
      redirect_to root_url
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, comments_attributes: [:content, :user_id])
  end
end
