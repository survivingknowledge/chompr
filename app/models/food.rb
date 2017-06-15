class Food < ApplicationRecord
  has_many :foods_meals
  has_many :meals, through: :foods_meals

  def serving_ratio
    ratio = 0
    #have to transform to float to maintain decimal precision
    if self.serving_size && self.calories && self.serving_size > 0 && self.calories > 0
        ratio = self.calories.to_f/self.serving_size.to_f
    end
    ratio
  end

end
