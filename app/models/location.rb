class Location < ApplicationRecord
  has_many :posts

  validates :city, presence: true
  validates :location, presence: true
  validates :lat, presence: true
  validates :long, presence: true
  validates :google_id, presence: true
end
