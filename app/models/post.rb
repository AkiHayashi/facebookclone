class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: {in:1..75}
  validates :image, presence:true
  mount_uploader :image, ImageUploader
end
