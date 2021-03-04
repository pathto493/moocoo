class AddPriceToPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :total_price, :integer, default: 0
    add_monetize :purchases, :total_price, currency: { present: false }
  end
end
