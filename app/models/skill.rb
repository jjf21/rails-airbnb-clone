class Skill < ApplicationRecord
  has_many :products_skills
  has_many :products, through: :products_skills
end
