class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :post_categories
  has_many :comments
  has_many :post_categories
  has_many :board_items
  has_many :boards, through: :board_items
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :photo_url, presence: true
  validates :user_id, presence: true
  validates :location_id, presence: true
end
