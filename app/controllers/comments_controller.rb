class CommentsController < ApplicationController
  def create
    photo = Photo.find_by id: params[:photo_id]
    if photo
      comment = photo.comments.build comment_params
      comment.user_id = current_user.id
      if comment.save
        redirect_to root_url
      else
        redirect_to root_url
      end
    end
  end

  def update
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
