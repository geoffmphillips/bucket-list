class Post < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :title, presence: true
  validates :photo_url, presence: true
  validates :user_id, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  has_many :post_categories
  has_many :comments
  has_many :categories
  has_many :boards, through: :board_items
  has_many :categories, through: :post_categories
end
