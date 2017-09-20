class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
    	t.integer :recipe_id
    	t.integer :ingredient_id
    	t.integer :amount
    	t.string :unit
    end
  end
end
