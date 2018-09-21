class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :boards
  has_many :comments
end
