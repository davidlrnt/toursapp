class CreateBadgeUsers < ActiveRecord::Migration
  def change
    create_table :badge_users do |t|
      t.integer :user_id, :badge_id
      t.timestamps null: false
    end
  end
end
