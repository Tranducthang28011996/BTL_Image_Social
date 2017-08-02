class Photo < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :commented_users, through: :comments, source: :user

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  accepts_nested_attributes_for :comments
end