class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  after_create :send_notification

  private

  def send_notification
    return if user == photo.user
    notification = Notification.create notify_type: :like,
      entity_id: id,
      sender_id: user.id,
      receiver_id: photo.user.id
    ActionCable.server.broadcast(
      "#{photo.user.email}_notification_channel",
      status: true
    );
  end
end
