class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
