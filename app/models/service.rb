class Service < ApplicationRecord
  validates :name, presence: true
  has_many :listings, through: :user_service
end
