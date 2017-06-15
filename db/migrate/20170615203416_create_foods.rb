class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :serving_type, default: "g"
      t.integer :serving_size, default: 0
      t.integer :calories
      t.float :total_fat
      t.float :saturated_fat
      t.float :trans_fat
      t.float :cholesterol
      t.integer :sodium
      t.float :total_carbohydrate
      t.integer :dietary_fiber
      t.integer :sugars
      t.float :protein

      t.timestamps
    end
  end
end
