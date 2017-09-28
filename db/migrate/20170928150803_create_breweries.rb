class CreateBreweries < ActiveRecord::Migration[5.1]
  def change
    create_table :breweries do |t|
    	t.string :name
    	t.string :phone
    	t.string :website
    	t.string :image
    	t.text :description
    	t.integer :distance
    	t.float :lat
    	t.float :lng
    end
  end
end
