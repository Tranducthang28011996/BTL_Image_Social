class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_photos = current_user.photos.build
    @new_comment = @new_photos.comments.build
    page = params[:page] || 1
    @photos = load_feeds.page(page).per(5)
    if request.xhr?
      render json: {
        posts: render_to_string(@photos)
      }
    end
  end

  def new
  end

  def show
    @photo = Photo.find_by id: params[:id]
    if request.xhr?
      render json: {
        photo: render_to_string(@photo)
      }
    end
  end

  def create
    if current_user.photos.create photo_params
      redirect_to root_url
    end
  end

  def update
    @photo = Photo.find_by id: params[:id]
    return render json: {status: 1} if @photo.update_attributes photo_params
    render json: {status: 0}
  end

  def destroy
    @photo = Photo.find params[:imageID]
    @photo.destroy
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
