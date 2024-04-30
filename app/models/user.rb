class User < ApplicationRecord
  has_one_attached :profile_image
  has_one_attached :banner_image
  has_many :services, through: :user_services
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 17, message: 'You must be 18 or older' }
  validates :location, presence: true
end
