class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, presence: true
  validates :price, presence: true
  validates :date_of_birth, presence: true
  validates :photo, presence: true
  validates :user, presence: true
  validates :address, presence: true
  require 'date'

  has_many :products_skills, dependent: :destroy
  has_many :skills, through: :products_skills
  has_many :reviews, dependent: :destroy


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def age
    return (Date.today - date_of_birth).to_i / 365
  end
end
