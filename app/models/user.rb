class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos

  has_many :comments
  has_many :commented_photos, through: :comments, source: :photo

  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo

  has_many :active_notifications, class_name: Notification.name,
    foreign_key: :sender_id
  has_many :passive_notifications, class_name: Notification.name,
    foreign_key: :receiver_id

  class << self
    def find_for_database_authentication warden_conditions
      conditions = warden_conditions.dup
      login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
    end
  end

end
