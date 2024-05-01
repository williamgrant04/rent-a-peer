class Listing < ApplicationRecord
  belongs_to :user_service

  validates :title, presence: true
  validates :descprition, presence: true
  validates :hourly_rate, presence: true, numericality: true
  validates :user_service_id, presence: true
end
