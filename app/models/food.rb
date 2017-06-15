class Food < ApplicationRecord
  has_many :foods_meals
  has_many :meals, through: :foods_meals
end
