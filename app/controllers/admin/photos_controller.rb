class Admin::PhotosController < ApplicationController
  before_action :find_photo, only: [:edit, :show, :update]
  skip_before_action :verify_authenticity_token

  def index
    @photos = Photo.all
    render layout: "admin/application"
  end

  def show
    
    render layout: "admin/application"
  end

  def edit
    render layout: "admin/application"
  end

  def update
    return render json: 1 if photo.update_attributes photo_params
    render json: 0
  end

  private

  attr_reader :photo

  def find_photo
    @photo = Photo.find params[:id]
    redirect_to admin_photos_path unless photo
  end

  def photo_params
    params.require(:photo).permit :deleted
  end
end
