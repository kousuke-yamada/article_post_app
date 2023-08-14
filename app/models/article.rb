class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
