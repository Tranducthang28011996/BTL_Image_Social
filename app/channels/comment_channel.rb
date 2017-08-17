class CommentChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "photo_comment_channel"
    stream_from channel_name
  end
end
