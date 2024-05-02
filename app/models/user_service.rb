class UserService < ApplicationRecord
  belongs_to :user
  belongs_to :service

  has_many :listings
  has_many :reviews
end
