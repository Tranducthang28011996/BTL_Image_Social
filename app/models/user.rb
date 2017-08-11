class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos

  has_many :comments, dependent: :destroy
  has_many :commented_photos, through: :comments, source: :photo

  has_many :likes, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  has_many :active_notifications, class_name: Notification.name,
    foreign_key: :sender_id, dependent: :destroy
  has_many :passive_notifications, class_name: Notification.name,
    foreign_key: :receiver_id, dependent: :destroy

  has_many :active_follows, class_name: Follow.name, foreign_key: :follower_id
  has_many :passive_follows, class_name: Follow.name, foreign_key: :followed_id

  has_many :followings, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows

  mount_uploader :avatar, PhotosUploader

  class << self
    def find_for_database_authentication warden_conditions
      conditions = warden_conditions.dup
      login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
    end
  end

  def follow user
    unless following? user && user
      followings << user
    else
      false
    end
  end

  def unfollow user
    if following? user
      followings.delete user
    end
  end

  def following? user
    followings.include? user
  end

  def feeds
    Photo.order(created_at: :desc).where "user_id IN (?) OR user_id = (?)", following_ids, id
  end

  def like photo
    unless liked? photo
      liked_photos << photo
    end
  end

  def unlike photo
    if liked? photo
      liked_photos.delete photo
    end
  end

  def liked? photo
    liked_photos.include? photo
  end
end
