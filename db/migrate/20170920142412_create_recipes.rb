class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
    	t.string :name
    	t.string :description
    	t.string :instructions
    	t.float :og
    	t.float :fg
    	t.float :abv
    	t.string :image
        t.string :type_of_brew
        t.string :style
    end
  end
end
