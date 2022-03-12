class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :content, presence: true
  validates :recommendation, presence: true

  mount_uploader :image, ImageUploader
end
