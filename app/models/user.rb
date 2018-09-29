class User < ApplicationRecord
  has_secure_password
  
  has_many :posts, dependent: :delete_all
  has_many :boards, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates :email, presence: true

  def to_token_payload
    {
      sub: id,
      email: email
    }
  end
end
