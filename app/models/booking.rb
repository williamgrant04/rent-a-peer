class Booking < ApplicationRecord
  belongs_to :user
  # belongs_to :listing

  validates :start_date, presence: true
  validate :start_date_cannot_be_past, on: :create

  validates :end_date, presence: true
  validates :user_id, presence: true
  # validates :listing_id, presence: true

  private

  def start_date_cannot_be_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
