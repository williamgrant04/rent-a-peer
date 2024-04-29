class UserService < ApplicationRecord
  belongs_to :user_id
  belongs_to :service_id
end
