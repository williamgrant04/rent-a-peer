class Review < ApplicationRecord
  belongs_to :user_service, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, in: (0..5) }
end
