class Meal < ApplicationRecord
  has_many :foods_meals
  has_many :foods, through: :foods_meals

  #User.meals.totals
  def totals
    ignored = %w[id name serving_type serving_size created_at updated_at]
    totals = {}
    foods.each do |food|
      # add in user eaten amount later, defaults to 1.0
      ratio = food.serving_ratio

      food.attributes.each do |key, value|
        if !ignored.include?(key)
          totals[key] ? totals[key] += (value * ratio) : totals[key] = value
        end
      end
    end
    totals
  end
end
