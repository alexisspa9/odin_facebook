class AddCountsToPic < ActiveRecord::Migration[5.2]
  def change
    add_column :pics, :likes_count, :integer
    add_column :pics, :comments_count, :integer
  end
end
