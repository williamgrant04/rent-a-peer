class Listing < ApplicationRecord
  belongs_to :user_service
  has_one_attached :listing_image
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :hourly_rate, presence: true, numericality: true
  validates :user_service_id, presence: true
end
