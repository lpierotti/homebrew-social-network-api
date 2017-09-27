class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
    	t.integer :group_id
    	t.integer :user_id
    end
  end
end
