class AddTitleToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :title, :string
  end
end
