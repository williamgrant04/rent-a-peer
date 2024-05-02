class UserService < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :reviews, dependent: :destroy
  validates :service, uniqueness: { scope: :user, message: 'already added.' }
end
