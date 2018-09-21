class BoardItem < ApplicationRecord
  belongs_to :post
  belongs_to :board

  validates :post_id, presence: true
  validates :board_id, presence: true
end
