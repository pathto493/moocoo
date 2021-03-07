class AddNameColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :name, :integer
  end
end
