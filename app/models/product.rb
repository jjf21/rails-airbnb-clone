class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :price, presence: true
end
