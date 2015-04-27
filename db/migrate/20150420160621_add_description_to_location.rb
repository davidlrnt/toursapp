class AddDescriptionToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :description, :text
    add_column :locations, :image_url, :string
  end
end
