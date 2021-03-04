class AddDefaultToPurchaseTotalOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :purchases, :total_price, :integer, default: 0
  end
end
