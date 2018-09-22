class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category

  validates :post_id, presence: true
  validates :category_id, presence: true
end
