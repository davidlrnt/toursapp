class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :requirement
      t.string :name, :description, :type

      t.timestamps null: false
    end
  end
end
