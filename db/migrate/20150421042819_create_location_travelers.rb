class CreateLocationTravelers < ActiveRecord::Migration
  def change
    create_table :location_travelers do |t|
      t.integer :location_id, :traveler_id
      t.boolean :checkin
      t.timestamps null: false
    end
  end
end
