class Location < ApplicationRecord
  has_many :posts

  validates :location, presence: true
  validates :lat, presence: true
  validates :long, presence: true
  validates :google_id, presence: true, uniqueness: true
end
