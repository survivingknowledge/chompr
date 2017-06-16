class Meal < ApplicationRecord
  has_many :foods_meals
  has_many :foods, through: :foods_meals

  #User.meals.totals
  def totals
    ignored = %w[id name serving_type serving_size created_at updated_at]
    totals = {}
    foods.each do |food|
      ratio = food.serving_ratio

      food.attributes.each_key do |key|
        if !ignored.include?(key)
          if totals[key]
            totals[key] += (food[key] * ratio)
          else
            totals[key] = food[key]
          end
        end
      end
    end
    totals
  end
end
