class Follow < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name
  after_create :send_notification

  private

  def send_notification
    notification = Notification.create notify_type: :follow,
      entity_id: id,
      sender_id: follower.id,
      receiver_id: followed.id
    ActionCable.server.broadcast(
      "#{followed.email}_notification_channel",
      status: true
    );
  end
end
