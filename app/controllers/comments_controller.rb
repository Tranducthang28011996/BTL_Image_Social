class CommentsController < ApplicationController
  def create
    photo = Photo.find_by id: params[:photo_id]
    if photo
      @comment = photo.comments.build comment_params
      @comment.user_id = current_user.id
      check = @comment.save
      ActionCable.server.broadcast(
        "photo_comment_channel",
        photo: photo.id,
        content: render_to_string(@comment)
      );
      unless current_user == photo.user
        ActionCable.server.broadcast(
        "#{photo.user.email}_notification_channel",
        user: photo.user.id,
        content: "comment your photos"
        );
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
