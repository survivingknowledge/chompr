class CreateJoinTableMealsFoods < ActiveRecord::Migration[5.1]
  def change
    create_join_table :meals, :foods, :id => false do |t|
      t.integer :meal_id
      t.integer :food_id
    end
  end
end
