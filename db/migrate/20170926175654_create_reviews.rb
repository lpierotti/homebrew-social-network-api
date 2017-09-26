class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.text :text
    	t.integer :rating
    	t.integer :recipe_id
    	t.integer :user_id
    end
  end
end
