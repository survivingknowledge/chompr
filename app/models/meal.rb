class Meal < ApplicationRecord
  has_many :foods_meals
  has_many :foods, through: :foods_meals

  def foods_attributes=(foods_attributes)
#4.3.1.4 collection=objects
#
# The collection= method makes the collection contain only the supplied objects,
# by adding and deleting as appropriate.
# 4.3.1.6 collection_singular_ids=ids
# so in this case m.food_ids=[array of foods]
#
# The collection_singular_ids= method makes the collection contain only the objects identified by the supplied primary key values, by adding and deleting as appropriate.
      #inside foods_attributes
      # ["0", {"id"=>"3"}]
      self.food_ids = foods_attributes.collect { |f| f[1]['id'].to_i }
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
