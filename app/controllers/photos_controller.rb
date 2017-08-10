class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_photos = current_user.photos.build
    @new_comment = @new_photos.comments.build
    @photos = load_feeds
  end

  def new
  end

  def create
    if current_user.photos.create photo_params
      redirect_to root_url
    end
  end

  def update
    @photo = Photo.find params[:id]
    return render json: {status: 1} if @photo.update_attributes photo_params
    render json: {status: 0}
  end

  private

  def photo_params
    params.require(:photo).permit :image, :status,
      comments_attributes: [:content, :user_id]
  end

  def load_feeds
    current_user.feeds.includes :user, comments: [:user]
  end
end
