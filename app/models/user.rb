class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }
  has_secure_password
end
