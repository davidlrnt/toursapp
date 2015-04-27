class AddContentToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :image, :string
    add_column :locations, :audio, :string
    add_column :locations, :video, :string

  end
end
