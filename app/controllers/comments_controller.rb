class CommentsController < ApplicationController
  def create
    photo = Photo.find_by id: params[:photo_id]
    if photo
      @comment = photo.comments.build comment_params
      @comment.user_id = current_user.id
      check = @comment.save
    end
    if request.xhr?
      render json: {
        comment: render_to_string(@comment),
        status: check
      }
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
