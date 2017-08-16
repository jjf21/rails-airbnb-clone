class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :price, presence: true
  validates :user, presence: true
  mount_uploader :photo, PhotoUploader
  require 'Date'


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def age
    return (Date.today - date_of_birth).to_i / 365
  end
end
