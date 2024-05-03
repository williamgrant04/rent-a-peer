class User < ApplicationRecord
  has_one_attached :profile_image
  has_one_attached :banner_image

  has_many :bookings, dependent: :destroy

  has_many :user_services, dependent: :destroy
  has_many :services, through: :user_services
  has_many :listings, through: :user_services
  has_many :reviews, through: :user_services #added to access it from the user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 17, message: 'You must be 18 or older to continue' }
  validates :location, presence: true
  validates :profile_image, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
