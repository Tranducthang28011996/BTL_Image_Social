class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_photo

  def create
    current_user.like @photo
    if request.xhr?
      render json: {
        count_like: @photo.likes.count,
        status: true
      }
    end
  end

  def destroy
    current_user.unlike @photo
    if request.xhr?
      render json: {
        count_like: @photo.likes.count,
        status: true
      }
    end
  end

  private

  def load_photo
    @photo = Photo.find_by id: params[:id]
    unless @photo
      redirect_to root_path
    end
  end
end
