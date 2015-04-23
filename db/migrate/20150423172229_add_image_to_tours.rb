class AddImageToTours < ActiveRecord::Migration
  def change
        add_column :tours, :image, :string
        add_column :tours, :imrl, :string
  end
end
