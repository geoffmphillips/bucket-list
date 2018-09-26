class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true

  has_many :posts
  has_many :boards
  has_many :comments

  def to_token_payload
    {
      sub: id,
      first_name: first_name,
      email: email
    }
  end

end
