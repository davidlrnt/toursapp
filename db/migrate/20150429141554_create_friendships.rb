class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
    	t.boolean :confirm , default: false
    	t.integer :friend_id
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
