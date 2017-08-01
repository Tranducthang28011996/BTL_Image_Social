class User < ApplicationRecord
  has_many :photos

  has_many :comments
  has_many :commented_photos, through: :comments, source: :photo

  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo

  has_many :active_notifications, class_name: Notification.name,
    foreign_key: :sender_id
  has_many :passive_notifications, class_name: Notification.name,
    foreign_key: :receiver_id
end
