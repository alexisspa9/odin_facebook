class AddBodyToPic < ActiveRecord::Migration[5.2]
  def change
    add_column :pics, :body, :text
  end
end
