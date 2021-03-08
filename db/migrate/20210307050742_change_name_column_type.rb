class ChangeNameColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :brands, :name, :text
  end
end
