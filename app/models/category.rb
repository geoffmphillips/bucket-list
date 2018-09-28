class Category < ApplicationRecord
  validates :name, presence: true

  has_many :post_categories, dependent: :delete_all
  has_many :posts, through: :post_categories

end
