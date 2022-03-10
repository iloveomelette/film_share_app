class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :recommendation, presence: true

  mount_uploader :image, ImageUploader
end
