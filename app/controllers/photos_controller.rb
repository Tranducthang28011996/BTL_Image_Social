class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_photos = current_user.photos.build
    @new_comment = @new_photos.comments.build
  end

  def new
  end
end
