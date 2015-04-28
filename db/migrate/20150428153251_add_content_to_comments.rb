class AddContentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :image, :string
    add_column :comments, :imrl, :string
    add_column :comments, :audio, :string
    add_column :comments, :video, :string
  end
end
