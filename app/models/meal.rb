class Meal < ApplicationRecord
  has_many :foods_meals
  has_many :foods, through: :foods_meals

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
