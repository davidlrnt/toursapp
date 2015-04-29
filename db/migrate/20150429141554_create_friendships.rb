class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
    	t.boolean :approved, default: false
    	t.integer :friend_id
    	t.integer :user_id
    	t.string :status
      t.timestamps null: false
    end
  end
end
