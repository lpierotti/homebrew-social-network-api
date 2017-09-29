class CreateChatroomUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chatroom_users do |t|
    	t.integer :chatroom_id
    	t.integer :user_id
    end
  end
end
