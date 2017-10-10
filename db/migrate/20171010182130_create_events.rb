class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    	t.string :name
    	t.string :description
    	t.datetime :start
    	t.datetime :end
    	t.string :number
    	t.string :street
    	t.string :state
    	t.string :city
    	t.float :lat
    	t.float :lng
    end
  end
end
