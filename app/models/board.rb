class Board < ApplicationRecord
  belongs_to :user

  has_many :board_items
  has_many :posts, through: :board_items

  validates :name, presence: true
  validates :user_id, presence: true
end
