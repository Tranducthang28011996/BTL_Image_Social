class NotificationChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "#{current_user.email}_notification_channel"
    stream_from channel_name
  end
end
