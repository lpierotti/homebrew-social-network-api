class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
    	t.string :name
    	t.string :description
    	t.string :instructions
    	t.float :og
    	t.float :fg
    	t.float :abv
    end
  end
end
