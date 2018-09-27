class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :delete_all
  has_many :boards, dependent: :delete_all
  has_many :comments, dependent: :delete_all
end
