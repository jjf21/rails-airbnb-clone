class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :skills, through: :products_skill, source: :skill_id
  has_many :products_bookings, through: :products, source: :bookings, dependent: :destroy
  mount_uploader :avatar, PhotoUploader
end
