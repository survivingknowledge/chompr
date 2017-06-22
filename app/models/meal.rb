class Meal < ApplicationRecord
  has_many :foods_meals
  has_many :foods, through: :foods_meals

  def foods_attributes=(foods_attributes)
    foods_attributes.each do |food|
      # ["0", {"id"=>"3"}]
      id = food[1]["id"].to_i
      food = Food.find_by_id(id)
      self.foods << food if food
    end
  end

  def self.totals(collection)
    ignored = %w[id name serving_type serving_size created_at updated_at]
    totals = {}

    collection.each do |food|
      ratio = food.serving_ratio
      food.attributes.each do |key, value|
        if !ignored.include?(key)
          totals[key] ? totals[key] += (value.to_f * ratio) : totals[key] = value
        end
      end
    end
    totals
  end

end
