class Notification < ApplicationRecord
  enum notify_type: [:follow, :comment, :like, :tag]

  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name
end
